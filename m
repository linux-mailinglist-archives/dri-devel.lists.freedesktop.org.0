Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673664C360E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCC310E15E;
	Thu, 24 Feb 2022 19:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82CB10E124;
 Thu, 24 Feb 2022 19:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaWBJZ+Ao39MyuN88VDsrpuB0DKlutnH2r+NefU2/SkXNbXamZCoM6X9hN7OFmOpufgXFiSXqWDVCJm6NhvX9ACEdwOHnBZGymitKCWsiIPZ42XeADURg5MiOHqmMH84LLwKJIhFDQd0Zw6PxCED9786VqjMD9cGX8g2GquAF2BBSAW9eLNfyDkgnjZBbmiZ3VhEJwjQqHjS8PyneWvp8j5I1rTy8EM22DBqwlaJFXgW8cf+ihu86vzdjtXQzpo3OFOobqCWRtxYza437pe1g5p4n1xKgoXCW9c5bJXW6Mgwzmf2Q5SbhqZTmuludvmhYFqCLWhKNT5K55x9llonYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKNYjXRmKqtiCh4kegfkCxYI1NKJ7n8ZCDGIG5LCchI=;
 b=YRrT+IyVGccEsbVHgoSHFalQKzoL322B69krMgeYVJGCjnYjm1QZnPtNpp5IQvmjr/ko/CC5JXDmLh7bsQCF/6QJuar+8odazBt8PVdHONu9Q6YuxIgSmIguIdMPr/j0rdT+fDkEL4ZDz2CRrKdlW50JFRW3ksbE5RhQmryUyHn9FAGNogu46DHrKwf11kvPxNyUNRqrpAaPO8dN4H80LxfLCOCF9z2soX90hWEXec7vVCdCXCqdqfobgDvrWc3SlqXY6LYoDxkhl0Ut215Mp2AW46cWkKCEw7A1dMkCqTK7i+2YdUMpN1KAapXHJs52268pxtRL3SiDw5vbpyKwxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKNYjXRmKqtiCh4kegfkCxYI1NKJ7n8ZCDGIG5LCchI=;
 b=p5lLmM2xhbTH2SdPGm8izczZgfv2RlJhGBIw0NA/jCrVhC73eLeORiyjGwU+6laqpXl+Zsm3XOBxMb70fWPYqjHYq+GfN7AIRyUqoQX9Z87aN65aXsXK4J92VyfWJzcU1krvmEMNWEZRZ52knfjfxwsRJIKMV0b+CC8X+QPj4fY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MN2PR12MB3069.namprd12.prod.outlook.com (2603:10b6:208:c4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 19:44:03 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3%6]) with mapi id 15.20.5017.022; Thu, 24 Feb 2022
 19:44:02 +0000
Message-ID: <cf085422-d109-2e7b-aaef-083d75fcef10@amd.com>
Date: Thu, 24 Feb 2022 14:43:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 0/4] Address a few compilation warnings
Content-Language: en-US
To: Magali Lemes <magalilemes00@gmail.com>, airlied@linux.ie,
 alexander.deucher@amd.com, christian.koenig@amd.com, daniel@ffwll.ch,
 Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com, Xinhui.Pan@amd.com
References: <20220224191551.69103-1-magalilemes00@gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220224191551.69103-1-magalilemes00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::22) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23a35f37-9b26-40ae-7f82-08d9f7ce0238
X-MS-TrafficTypeDiagnostic: MN2PR12MB3069:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB306971CC8A19A7E266DBB5428C3D9@MN2PR12MB3069.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mSVQ7cCL5VccmzI62kZmoWs35mOyelUdrV8Lj7gRpJVc+6SDCNzw7s/cxW6uHkrjFYaLDVr1zUP5FkUZ9UKXeGZjak83qhdi9miA8h8y1h88l+bbddRqKa1ap9NiyYwTWh+JedzUEbqw81EZbz6EMNYLHbCbuHb+qOrm8nWJ0ExuIzaL1leeh98Bu2iXjWF+nNg3+67KW9Vj+CEwweD4QcnmAcCOVyQJkWx8Z9p5P5Vfs+lIkrW9b8Y2GdL20tksvze1/XtQEljoRBvORFYpb0WTwymsbQqqLk2jpwFi5GYwlmQzQHXLx22sOqfUCeJH8xk3MTO91R22xHTtusvm2ySzi10dsP2S8kZ72QMAWQY+VTjaMEeW3yds9LT5/BBtazvWZDUEXF4LeaDVe5rjq4jSEV+dt6teATEEpNoXCsIprUe8FXjMJiGsV71OP5FYVX6Ahs6q2j9Ab0oireIGMAGV2x4ekWdhpsLqZbMgVK0mF+PgtK6IaS2oITUbAYN4N3SZ71z50Q1CDiamS9vvdcnjmP6MK39WIb8ogBuW+qImcsS8wU1jWVRqA9AhuMM4xccPdE+9NXGhFN/shNgZ3fAKbXTgnECq/r+QablQY847wkDJ0a/4RIYSTA3zofA7/N21Zi7V73NAHUY6g13mmz0mnOpaGpWFOUN1wvhljmsAFD/EE2ovK+dbJ73x8QbKSBl9cf/Jpu5y+N7ot36dtDUQxb0HY51rhYyIB8JIzH7CkoX9UbnnB3Unp9grvdqr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(31696002)(6636002)(38100700002)(8936002)(186003)(6486002)(26005)(4326008)(8676002)(4744005)(44832011)(6512007)(66946007)(66556008)(66476007)(508600001)(316002)(5660300002)(2906002)(7416002)(2616005)(83380400001)(36756003)(86362001)(31686004)(6666004)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3BXcWtuZUFxV25MYWMydzNrMFJSSXgyK2JuN3Y0NzNxZ1YxOGlrYm1IdFhP?=
 =?utf-8?B?SkFuclNhMVFqWWhWSXZaS0Y3eVV0amRCUEFWOGlDbDRic0dIQjdTTG9mYzly?=
 =?utf-8?B?aHJWQ29NVHo0cTdDMXlHZlhyTGd1TURyaHRDZ2s4ZmxBSzMzOHBGNmdNS2pv?=
 =?utf-8?B?N1VJQVF3TzZsY2hwcitjV25DdUdhb1p1Nmk2Slp6Mm5vTFZTRWhNcTNiUmlo?=
 =?utf-8?B?LzFXYnQxZGNkTjFFRmpvR0tQai9GY1dZTDJ0akRNSGQzUkxucEtRODB6UTJ4?=
 =?utf-8?B?Q0htemdxL1BMVnhTSjFETVZRbk5zakpxL0VBN3VYdHl4Snp6NU1mWFZSNnpI?=
 =?utf-8?B?QnFPd2FUeXJLQTAvNTUwWklTY1c0cXVhY3plYVpBc1J0Y1crSjZFSzdWclpT?=
 =?utf-8?B?YUNqRFVQcDRFUGgySHVGRDVpOUtXUkpvbmZLM2NkcFpvSXcrc3F1S0V6NHNJ?=
 =?utf-8?B?NmF6QjNCZGtwYkt3UWtJeTFRenRyRzZxQUU3aTUwM3RJbks1dUZ4MGZ2MDVi?=
 =?utf-8?B?ZCtycEgzVVdFd21vcXJtbWxYeGJDMzY4RFFoVU1BaTRxMDRrYW5OWGs1MFhY?=
 =?utf-8?B?NHFHVGhuRXJoUTJKR1hLM2toQUlYOW5LUlByMHRTdzBXU1R3OThKUXRCWVFS?=
 =?utf-8?B?ZjBVU2E4L3gwbCtWWkRJU1N2TGRDVEcwZC9SOEhtd0VvejdoMHpndlpWZ3cy?=
 =?utf-8?B?YjV1blFhVFdoQ2tsVzZwSkFqV0p6aGVxS1prRUR4SzdqZWVZTE1Lb2JXTGFi?=
 =?utf-8?B?dFZoVDRQZ29XcXN0ZnRVUHFRL202OEFGeEt5UzFVUGZWSEdBeU1hWG9vbFBD?=
 =?utf-8?B?dUNEd0dwdkVzeVpoSzZsZVUxK1FuSjJPNlVVR3dqZjBXclYxZjZaMXMyRTNv?=
 =?utf-8?B?Q1BRUzRsVzVzZEtpUGhrWFM0a01sS0J3WE1wZUxVdFAyZ1ltOHIwKzRHL2J4?=
 =?utf-8?B?YkVZQkxRVEJBL0JCUGJiWmczY3QwTDRmOU9sSkJvK1VXK0FmdEdLbGFLWGlC?=
 =?utf-8?B?VDRuR0I4blFmT1JXY1ZiblRmVDJNdlYreDF0UldJc3ZkalF3bnFhQWhvb3lI?=
 =?utf-8?B?bEdXbk9WY0E1d0NNL1kvZCtmSlV1blVid3F4Tm5tNW94b3lvSmc1eWk1eTBV?=
 =?utf-8?B?SEYzdVE1bUJaSWY2STdwUFJCUEF4MU55c2tZMGp6K0dMd0EzVDFNQldRVkRM?=
 =?utf-8?B?Wm9UUk1GMVVYMFBlTjdGS0NRMTlBM05qYmhycmZxQUJDNFVTbGtLVU9PRWxt?=
 =?utf-8?B?OFBocXgyU3Z0Qm82MjVqVXJSUmxZTjRxTC9oQ21rVnFqTlZPNnEyQ1c4VnVP?=
 =?utf-8?B?THFrc1BoWFhuYWxHa1RGczlDVTR1WTBrT2lreVVzSTlYUVMzaDhhbFJXb1Qy?=
 =?utf-8?B?MEI4VWZtOEZpUEN6UW1pS0JybVZtbGZsc2NOcThrTkVqZXJ3U1BDSXlYQ1VQ?=
 =?utf-8?B?S2VxMEdwYjJPeld4ejF2SXR1N3pER1UveU9ib1VJWXUyRm8xTEFFTExFcFpl?=
 =?utf-8?B?TW1GZlZ1ZGhGQVpTMG53ZWNJUkRSWjhsNWc0S05lcDdob242L3FmTTFrS3Vl?=
 =?utf-8?B?WDFUNllYbVIwUTR2bDZVS1E4S29iWVRYd2xuci9sZlVPb0F3ZTIyZFRuYTRJ?=
 =?utf-8?B?dGhDL3oyUnoxbk5XOUhwQVVaMmFYSlBMZHN6K1FNdlM5T1o2ejVweVd3S2ph?=
 =?utf-8?B?ajFwWC83T0FDcHVqTWlGcE1HNVZ4OE5ZcEJ4ZHArckVtcVBkNFJiNFByb3h0?=
 =?utf-8?B?WVB2OGFwQW56RUxtNXhDMUZHcGZFcDdKUldkZERYUzNNVHJNTDIvbDQweE02?=
 =?utf-8?B?dmRFYlBtdWg2UFdhZlNRZFAwV3dackczNUtkdTdIVUNWbG1GQVhHM0JIYTEw?=
 =?utf-8?B?YWVZMFRTUTFJSVdGcWxWMWQzdjNzd0xCWG5qWjdEQ1QrNW01dFdmVnpWRzRw?=
 =?utf-8?B?RGZQQmhURVZwY2tsNitzWDNQSkJ1UWs3OURIY0NUcGF0MmVhUmZOclUzRlFO?=
 =?utf-8?B?VllBQVV5ZGZWbnFlUTIvMElLc3lRWk04cUVOYTVFczVnNDh6cnpFa3dDYzg3?=
 =?utf-8?B?MEpOaytVUmNCOXVXTzRaVTd3ZnY5S3ltZVdEajFuSGFnRHRUZGdKRXdxOC9N?=
 =?utf-8?B?dTc0NzU0d3hiR09TUXA0NmZSKzhJQVpUMlRhcjFqNEJSY0JsWE1rNHltbTZU?=
 =?utf-8?Q?x5zrLmaP7qOAgrIhyETkMOk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a35f37-9b26-40ae-7f82-08d9f7ce0238
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 19:44:02.5184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94rsWOjVfH9PmtOF3BCUa3vvEmB5pMJ0dbvpg+dLO1Zaj1mP7AHWPp+Ythi2MMbVB+q2i74MmHTWiKhjjBrHdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3069
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: siqueirajordao@riseup.net, maira.canal@usp.br, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mwen@igalia.com,
 amd-gfx@lists.freedesktop.org, isabbasso@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

On 2022-02-24 14:15, Magali Lemes wrote:
> This patchset addresses a few warnings reported by the Kernel Test Robot and
> sparse.
> 
> Magali Lemes (4):
>   drm/amd/display: Adjust functions documentation
>   drm/amd/display: Add conditional around function
>   drm/amd/display: Use NULL instead of 0
>   drm/amd/display: Turn functions into static
> 
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c   | 4 +++-
>  .../gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c  | 2 +-
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c  | 4 ++--
>  drivers/gpu/drm/amd/display/dc/core/dc.c                    | 6 +++---
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c           | 2 +-
>  drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 4 ++--
>  drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c     | 4 +---
>  .../gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c  | 2 +-
>  8 files changed, 14 insertions(+), 14 deletions(-)
> 


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FE944E6C5
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 13:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694EB6E4C4;
	Fri, 12 Nov 2021 12:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2077.outbound.protection.outlook.com [40.107.212.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DCE89FA6;
 Fri, 12 Nov 2021 12:47:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDRCNMSncHYQrs0Ee2xmIsi/YguOvThiudLmFheNBVbFVXchXWyer+3Q7mem86uWsqw0AMSDGDw7ZjQEA1t2fN6ncsbhx9O8ggb0/1Esb0ZdP7u2SbvxqCrVlQuv69QeXzV3K9fKns+FOHVTPHiqxy7+06mQ8kq44G1YcJ2oPFaiVVcO63izH8be9eYrB6qieGxF/up+7uFTzaHauoH1rMcIuX8u2MJk+8Mc+Gu3Tt1ufawajLQ8R+FUTj5+Z4w7G+7HiQyw13X/QFhfroCLAHRyjCevOrUD0oEqH5csZiXQIL/6xNxA3xYj5DYpIT+ILeXfeojkeDDgWqyTPucRBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZrEsV05vv5sxnyvz5E9R09pq4KlBWpbHOJW0NMB8Rk=;
 b=fuwI8mXHvrf2jRA2n/Y4qhoChO3EeKN7kMdPqwd6xv9rizHrO/4057uS+QEDmf+gxI+PgopwIxeHdYF7GCVRqC22MnaOXm11rAxe45REpIuf/MQUivy0WtchcpMYbH/eMVuJVt02YHP+su0xjCeY9S8DofeVyTtuEANagxrbFd4bE/iw7m2nNxjJExSn4rxnVynxT/hCAO1cruCFiA5axRV6sb39lbruNIf7F7t1M7I/kc0Rzck46VS/e7ZNCelhSMfhI1YQwjDU52dyh/o0xNmLa8qy1yJZlCK1S9FzeX/8Lhwf4vs//hB4zNORJAuP6UmLNEwOA4dDG9Era7FRqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZrEsV05vv5sxnyvz5E9R09pq4KlBWpbHOJW0NMB8Rk=;
 b=OSOarteydwLFsaebEBHcZTWOwQDsuWZLk64saQgY9lWfyjjeSkZePZ7HLU8Dg4UTDOk/4pcIblAlpZDM+XFl3u58vyDmzTDLHubu7YZpT/jsdY5PvvLpzs1EkN7MzOyYzfJpXF7k1nwT4B4ok8GwgwX2Wup0TAXqj/3Y0a4K1mk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com (10.174.101.14) by
 MWHPR12MB1709.namprd12.prod.outlook.com (10.175.54.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.13; Fri, 12 Nov 2021 12:47:52 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4669.018; Fri, 12 Nov 2021
 12:47:52 +0000
Subject: Re: Questions about KMS flip
To: Harry Wentland <harry.wentland@amd.com>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "Yu, Lang" <Lang.Yu@amd.com>
References: <579d0f44-bb85-11b2-d326-35a0b7c5d0de@amd.com>
 <5c242319-ade3-5621-6429-f77b17c34de5@amd.com>
 <YYV0W1CxT5torU7u@phenom.ffwll.local>
 <64e70779-7c33-7849-aa29-aeaee4a89005@amd.com>
 <YYk7SkflDx8ToqYG@phenom.ffwll.local>
 <4ba7e3f8-7956-882a-6888-57e2448b907d@amd.com>
 <YYvIfXy9bwPokiK9@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ab2fb071-12ab-da99-53c9-1411ca9acdaa@amd.com>
Date: Fri, 12 Nov 2021 13:47:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YYvIfXy9bwPokiK9@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR05CA0014.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::33) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:6e65:9f86:85:5884]
 (2a02:908:1252:fb60:6e65:9f86:85:5884) by
 AS9PR05CA0014.eurprd05.prod.outlook.com (2603:10a6:20b:488::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Fri, 12 Nov 2021 12:47:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0e2ecd1-d46a-4e94-533e-08d9a5daa3fd
X-MS-TrafficTypeDiagnostic: MWHPR12MB1709:
X-Microsoft-Antispam-PRVS: <MWHPR12MB170949C572B3C508B495912583959@MWHPR12MB1709.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JIknQapW/kKieFgCRlO1sIa/NspV9U8ZGX0R0Y4GUJ7GS9S7SvaM6j37YvM7rhEByzGrPVopUOM1R41N0BpRoEZVNiYYHH0yy9x2MqJrkol7pdPihZtm9Rusi0OFU0I7nDFyiNBLgKE4IyxZfU0nwsviT81yujsm/CKO9QChpO1CwqYp4iCM1UxitcNI/26IISP3eJt5/2XwzXG5vVXj6CQmIZhf7VFVBNZt6zkNMsE+oBjHLWKz99P3dKRSugd7ZWpVvQ/evoIDR6z2GYeCmKvHvxvp143KBbw/YQGbn9noC4RjetKVnTqyMfE8dF11rc8q9o0I8FmEzMylrCy5htGBSG7g71mOsVH6HjRdJLaBhB613f2stv8Tc43Vr9PtgDmcmN/vU+9PUHr6/fv6wEzrK5MlGANpMMkzpbTQHbyDkjbvN5gxZjx7MQb3xTLKTSP4BfSoyTpcTzj8LHonvB2SgurJphuLWJPHl6kYGFJv16wJOtiqBdASnrTg1uViZkpCtwYWpPEhXN4dQCvxLFXZcmGNSf4HG7zq/6QH8SFAoce9X1pKVmQOFBPWlJzYkyZ7QQYI2PC4Gxwz/JkuGsZaLT+e1YTIKIdjYMDMoIVrvj/Z+6zfw2aoGvMflyVF2s5oZoPaWeQzB0vHUvHMsZpV4TqsbffmfwmG1F5XvJkQ+htzfNGmhkoBDs6eivkW7N0DXKrZZd4U4PviT09c/LTiFOlM6rFIEicXKUYEnOP+yVOhQA+8i7rwDuWFVJsKp4/u3elSfeOK0vRUCYq5yKMIrK8dKRt+OUL/UpBQNrrPKEG6a+ekYj+WxakUhKQCFum67lFbVHJ9cjkvMsV+WQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66556008)(8676002)(66946007)(186003)(4326008)(5660300002)(3480700007)(8936002)(2616005)(2906002)(966005)(508600001)(6666004)(83380400001)(316002)(54906003)(6486002)(110136005)(31696002)(4744005)(38100700002)(36756003)(31686004)(6636002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3ROWFN2RWduQnRTajh0Q0thZTdRWkQ0ejJsQ2NqekpNR3lwNXNxTzlYczVE?=
 =?utf-8?B?cVZKMjZsMWVPUU1TVC9KU1VDbjhIYk53VnNLZnkxVFY2UnRTKzJTY3lSclF0?=
 =?utf-8?B?NDJ5UVgvWUF0TGJRb1draVJtTEg2R1RydXByN0c2c0ZzUlZ0aGhWVmRJTThy?=
 =?utf-8?B?cFkrOVFLT1VqdmQwVUlUK212QUphN0NoZ0xHSmk5STJNZmRRUHdjUlZiRnRP?=
 =?utf-8?B?QlJiSDRnaTI5SW5HL1dPTE1XT2VOYmdnb2thTyt4OWVvK0NOeWdVd3VSMlds?=
 =?utf-8?B?Qml2SGYxZnlndExDSnVid3gxMFEzTjMrdXR4Wlg2Z3phcTlVSm41QWRQbDlO?=
 =?utf-8?B?RHVybjBCUXo2eWVVNEZmNXFNRFRNcVNLemU0RnZFbnoyR3VaZFlORFY1VXBU?=
 =?utf-8?B?ZGdiMkM3ajIzanVRVVIwL28xb3RaQjF3NjJhSWJHTGZKa09XVXVObHA1OWpR?=
 =?utf-8?B?Z2NIaE1YZENjM0U0TTJpVWJWM1Rna0V6Y2xrTWc3a0JsbXhRZ0M4NVRFMWp3?=
 =?utf-8?B?Tmc0ajRoRG92aGR1dm81WE5VVnVsWTNlcUFZMVF3cWxqdXB5b2MycXVabmlJ?=
 =?utf-8?B?NzE0YTMxdEpmL1NEZ01oeFFwOFA5SzhucnJ6eHFPOXlMcnpIaUthOVVDNzRv?=
 =?utf-8?B?TkpXU00yL25SRTNGWnNTOVRDR2ZGbmFDaDFqR2V6RG5sTHpIUVY1akRvK3Bo?=
 =?utf-8?B?ZDhFMXlCTXpaaUN3UG9XVDdybVpWdFVqaXFvcXVLWlU4cjdYQ2hoTmlHZzNE?=
 =?utf-8?B?a21ZWExqUkh3QnZhcEtRMGY3Z1FoelJ3aUZUS2gwakZzNzV3bUNRbnN2MWdB?=
 =?utf-8?B?bmtjYmJqM3oraUdoOHdlU3IyeHYzd2RDYzdUT05VZGl2QVVPK0tzcU5kUmsy?=
 =?utf-8?B?SnZUL0JHampEaDFXbVRtWGFIMityLzJ2TUxVcmFHbkdOeEtrd3d4cjFCMnc3?=
 =?utf-8?B?WDE4Vm5kSnZTU0RONHROU0JZYXBQWFEvNDh3bzA3M0o3UXdDbDlvaHJ4bXRh?=
 =?utf-8?B?Zjkzemdlc1RWTk9nWko3aWNxQ1ExMHRiT3cydmR4Z3NvVWtCNXFhTG1QaVN2?=
 =?utf-8?B?N2xya0pZVDJVNlFLZEw1azR4bTJuN1Rpak5YVmh5M21VZHMramdOVFlsSmZG?=
 =?utf-8?B?TkcyeEg5enBvQnFOWWpvUElQRmcvZ3hNQVR1TXlwWEFRd3l5OW5pckpFcE05?=
 =?utf-8?B?bUI0WWNFM3Vsc05GSWRrTFZRZlZFdVdGOGtqckJrbUcwMmNHY01XU2Nzd1d5?=
 =?utf-8?B?WHVubFlKSFRwa2ZFUUhwdWxYWU5ueHNhVXd1eVcrSGxMRE9WdU1OTk45RlE4?=
 =?utf-8?B?YXd6c2xWSzdkR2FYSXA1SXVPakQyL1NHcEg4Qnpzcm9XWXAzcU9GektQbnN3?=
 =?utf-8?B?ZTJiTnI2eGxianRwYjIrZ2V6VG9kM2lBVmdKTzhwa1hvTDJqc0srRlk1Sk4v?=
 =?utf-8?B?cnBsOU14ZmNmYWVRaFdMUWRSTnNDbHV6c1NsZHlEc3cvMW5iR2pYUmRGV0Vk?=
 =?utf-8?B?QzVlVExwYk81d2MranNwWkFBNnNDb1dTL3lRcm9kYWdwb25sU2p2bXBPWGpQ?=
 =?utf-8?B?WTlKNDhscU8rdlZsbDI1bmh5VHRhajdxZ2lmSFNwRmdHWWwwbWh4MWw5anZU?=
 =?utf-8?B?dXpWRG14dGtQdlA5MWhwaDlVY01VQktHVko5YUhCamxmMUlqSGhFcTNCTThr?=
 =?utf-8?B?WVp4MnVZSm9CSWZJWlpENE1KRmU2K2ZqMWtKYUE4QXRpNEQ1Vm1zeVl5UGhm?=
 =?utf-8?B?M0tUU05VUGs4YXVXemo3dVEwYzdnbVJzSDh3ZUdINnVoeUJWS0lteFNObUtn?=
 =?utf-8?B?RkhrM3o3WnFOQ0ZYSVdGbFA0bWI0RVAxNEVjaThxeTdxZDd5eW5Rb1JQYUdj?=
 =?utf-8?B?RjJmWTFTaTBZOWxBQmtHYVQ1LzlWdnYyOXBTY1RqMXlnOFdVUDBGK0wvK3Nt?=
 =?utf-8?B?SWlhaFhXV24velMwMitKQjVSR0hFY0JBQ3VzN1JmeE4raGR2bnArUXVJWUUr?=
 =?utf-8?B?czBzbytQQitCTTJ6dGpkZmthb0NGajdnVWx0c0RkTDRWdWtNOXV4Y3AwLytR?=
 =?utf-8?B?ZGNkdmlOWjQ3YjEzNWRBWTB2dDIzVnpvdlJ0cDB4SE5KZzdTNmczU0EwQzlv?=
 =?utf-8?B?bGljcEluMGhmZGFTaEtYV3dTN0p1REhyZVJWMnNmQU5oWGQ5cU9DbzZwZ1Vv?=
 =?utf-8?Q?tR+ABxeV6uzqnWpNQ/zJ8Nc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e2ecd1-d46a-4e94-533e-08d9a5daa3fd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 12:47:52.4546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jI2yf/Q8zMQDea3KUqzn7UkK05SNuyeoWqol9QarIaGIjOJTY90qoy4HDiZBYtG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1709
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
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

Am 10.11.21 um 14:26 schrieb Daniel Vetter:
> [SNIP]
> stack depot, not stuff it into a string. stack depot is a lot more
> efficient and capturing backtraces, since it de-dupes and hashes and all
> you need is a pointer iirc. linux/stackdepot.h for interface, I think we
> recently gained a few more users of it in drm. It's _really_ nifty.
> -Daniel

thanks for the pointer Daniel, that framework indeed looks like it can 
become handy.

Anyway this unfortunately turned out to be work for Harray and Nicholas. 
In detail it's about this bug report here: 
https://bugzilla.kernel.org/show_bug.cgi?id=214621

Lang was able to reproduce the issue and narrow it down to the pin in 
amdgpu_display_crtc_page_flip_target().

In other words we somehow have an unbalanced pinning of the scanout 
buffer in DC.

What should we do about that?

Regards,
Christian.

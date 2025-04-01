Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3D8A772CF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 04:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D070F10E4D4;
	Tue,  1 Apr 2025 02:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Mr3sOI7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462C510E1D5;
 Tue,  1 Apr 2025 02:43:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSPg3ZRsziK1FtZFjhUKsuK5GZcCrdO6M34oVVU1GUjB5gzUWUVjqH7RanMDVA/IZppMfeLGrF9GvAGFiQrIjcL1t4Odbqh//umTqJLMCerXdgr53al5QYi7y0TaMv9Nbw9GlY8yWdQfLB6PTotkUctXR4g+XTCJY+YERhY4l3BFTTW6n0tf7oziIx/Ug8IvQXLxK3Sdg3tmNlZzEaB/7lDRGN8TSL5bahhD8eM2mmBLNCewFYYFtFTP+kApgQuM2rGmYdyE6SfHOLklx2CebgvNIyGVGmFcdmz8xV0CwlxAIQWlJU/Ep/dZOv9u4ULrfG10VPhBaYEzvfANhSJUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2n8+FDIDUOxQvhgi5MXTRYwLEOo1GIkZza/9sWIsM+8=;
 b=NFSqLVwR5gT5FQHqrLxHEBwWqKKGX6LgR9Tse05bWRqSiPu+PMFNiewYLDCDNOwdRWtdwGGMIpmeocali9ycFEfQCJJCHPcHNg/C6SaQl+YdvsgHHEXrw2hrai8ns4wi09gPftwVcRhcg9pie4SsjqjFgd6h6G0W7GKeJIhbdQ6F2rXrlDgGrtNEujIq6NFRQGdVsp9eBliKhgP60Au5hSEXtAjvWc8es6Q8E9H2Fp+PD8gYuTagGnWh9urG7K079s4B8TAj2GbZ0QpvOkBiXSmLeF5NaxBfH0RmK1JlWaYcV+RjwB3p34HspvVH3OeAQtLhLGHyOt9qILkpW5+bNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2n8+FDIDUOxQvhgi5MXTRYwLEOo1GIkZza/9sWIsM+8=;
 b=Mr3sOI7vno+PQuuh27ptPYPtCLmAPgbNiDYeZk6yaReMX8zPg1tdKuNAk6+0zeo8N43mVVnT9+8iLhJSxwfb9e4o5JogN52oJ1AbzHXdwlelxuckhH9YnnwgG2h9BW16aKDijKDAAcLj/49PjJIowaSLHiD8uyare8hfK2xHkj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH3PR12MB9080.namprd12.prod.outlook.com (2603:10b6:610:1a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 02:42:55 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 02:42:55 +0000
Message-ID: <a8aae4e1-59ed-4a03-a4f5-6f70cd92ebd0@amd.com>
Date: Mon, 31 Mar 2025 20:42:50 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 43/43] drm/colorop: Add destroy functions for color
 pipeline
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-44-alex.hung@amd.com>
 <_GmbIozpR3Vwp7BPlTFO3i1Kn2S3SIYiQLIbF4TEizuVzpkcUrTZWj87cDM8l_ArWVpCKWJVYJyrNX3ElPuu-fOb_J5C5dVhGfdLkQ5Y5k0=@emersion.fr>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <_GmbIozpR3Vwp7BPlTFO3i1Kn2S3SIYiQLIbF4TEizuVzpkcUrTZWj87cDM8l_ArWVpCKWJVYJyrNX3ElPuu-fOb_J5C5dVhGfdLkQ5Y5k0=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0116.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::6) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH3PR12MB9080:EE_
X-MS-Office365-Filtering-Correlation-Id: b496a3f6-030e-4bea-baea-08dd70c6e7c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzJSWFV5RHNLWkpiQnlLWThZQ01halNBY2VBZDZnQmVWM3hHU240Ny9vMTEz?=
 =?utf-8?B?dkl1SDB5S3k3TGpWREdlTTE0MzhpWlhEOUFvZlpoTktPS3MzVXZXaitQV1Vj?=
 =?utf-8?B?TnlCN2gxakpYSnhNUjNhdHYzNk42anB6NVdVZWVraTk3VUVZaWd0OEI3L1ZI?=
 =?utf-8?B?S1hDVnJyWlFhd1piMlY2TGIzSVAreEJQSmdTQmhKNWhEVnI1VnI4NE0yU0Ix?=
 =?utf-8?B?eGFCY3lqYjhraEtsZ0xFUm1Td1BhNFVGbC9iQytUMDlSdituRlY4UERuZVo0?=
 =?utf-8?B?V2d0K0hnZjc4REduL2xrSmNZRGVzT1NHY2pXN2o1aTEyWG5IS1lpbWF2cFZO?=
 =?utf-8?B?RXNKbzk1byttcUxVK1RBaU5aY01QYWZnQ2NCalp1Y0M1ZUYxWENaN0ZqVmJ1?=
 =?utf-8?B?UmpXdDBnTENTaEVBY1BJbkZvY1YxWG9JS1htN3pVQ3l5MUZxak1SdlN1MUJV?=
 =?utf-8?B?cVdYZktoNDRpUGpjQ1hwUWlGTWVRRGtqckdJdjVpVUZ3NUliT1dwTUI0V2tP?=
 =?utf-8?B?QTdKRDh2dkFhemNyYUdNL3d1SC9HY0U1T0NHSlIzR2lJcmptRXh4T09ROFY2?=
 =?utf-8?B?ZG5Ud1V0aTlOWENOSFJyNmVFTU1RblRoTFRJU216QklwYmFjWGdhQmVkem1O?=
 =?utf-8?B?b2JITCtta3RabnVWWHBSYzgrV3dXQVBpdG1wTDZ0M1lsdjl1QnJyU05BRWhn?=
 =?utf-8?B?K095eEFMZ21hVGxnVHRibDhVSU1qNTljOW9ZR28wb0t5eC9sbXVRM2ZKY0p5?=
 =?utf-8?B?MTFUbG9TemRSNEF4Q3NmWDFGaFpVaytCVWdteGxCRG1paG5LSVV4WlJDanJZ?=
 =?utf-8?B?Z2dscVVYZlg1U0Z4aEJET3owWmJGdnN2MFYxRE41aEZzdUZkRlFLaE13SE5x?=
 =?utf-8?B?VUk1UkFneU1DSnlQQXZnd1M4S2JPOTIyS1IydlVzNTFra0M2VTlqOHFjN0xj?=
 =?utf-8?B?OVBKaXozQzlUQzdpczBYY1kxVjZISVlNWTRLK1dtUTBuWkhIdVNNekhlRlo3?=
 =?utf-8?B?cTlWVDdMcVN1SWdnaWVEaXVwbW9tT2hQbFo5UFlVcEVnWVhaYnZaU1ZJOUZC?=
 =?utf-8?B?Y3FabitCaDFsZksyU0lJT29sUVBjdi95VlN5L2xtYkh4dDlXS3FzS0xEcjZ6?=
 =?utf-8?B?NitPTGlvdkExaFpyY05YNS92cnVKZENoc3VXdjFoektiTGs2YkZCMzIwejFH?=
 =?utf-8?B?NUhJSW95YnQxcEpLdnlEN1VTY1YrUmRxMktxRlBORTYzTU0rNElyQTR1MFNa?=
 =?utf-8?B?bXZZaGhhZjZaaUpDSGVIOXlPcDk5N0FzaHl4MG1jNnZ4WTA4YUpTQmRuMlU5?=
 =?utf-8?B?VURDbEY4bWR0c05OUmhqRHNHYjRXRVpKc2I2TnVtYmkzbGp1R0dqVWxnK095?=
 =?utf-8?B?OTd6THZRL0gwRkJETnB1RlhXN2tVOHZ1UytXNTlzbzd0aUk5b2QwSVNIVmRl?=
 =?utf-8?B?c1dOcW92ZE5iNFZRNUE5L3NPZW1PYXlCMHNDc1gxWVlNeStwTGJQQzN3bkwx?=
 =?utf-8?B?QndOaS94a3dpSFJqeFpBbFNoRWMzN0NLMU0zRnBQU2tCcUNTZE92RUZ2NnYy?=
 =?utf-8?B?M3dKaXFJckJqOFF1UDkxOGFPRjgzOEpkVENGVnhxMXhrM2pmUGVwb3V6N3BP?=
 =?utf-8?B?NFJoTzM5ZXFnSEhDZkJQNE4wRVZiVXU3bUVRS0FoaEpjL2VWbEZzUlFiTzg3?=
 =?utf-8?B?OGFpQmpabEYyTEFUQmt0b281cUdscVJFazZqcVVlV3FidStkQnRQaTY5Yys5?=
 =?utf-8?B?UTdDMjBTTWpVbmI0clhXcnIxT0tNZXBoODNKOVZxUWhPTnJFVExnVmdIUEVS?=
 =?utf-8?B?cC9tWGtBSWpueTJZUlRVOWpwVWJOTWZyM3JmL1FvUEM3TGZaT3RjNzJVVTNM?=
 =?utf-8?Q?f66HY+n0jgpEc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzJtOXJxazNEQ1hBYkFXODNVR1FsSHZ5YzhXNXZQT21hQXAzaHdaQ21YT21p?=
 =?utf-8?B?cnhRejVMQjhzVFptRUpLK0NjMmtKNncvUEtSQnVlRXdqV2xuZ3FDRDFkVWNW?=
 =?utf-8?B?c0RkSUJWSlgweDcySHVIdVh4Q05FTDdnekVuNzE2VEhBUWIwbjNhRGlJa1ht?=
 =?utf-8?B?R0pkbm1pRlo2bWlPMGRHbHY3ejZTQzNQMy9WaEJuc2pwUXVUbmNDeXZIZXNh?=
 =?utf-8?B?MWcyVS9XRllmQWJ4TzNDMmE3TkVBcWgzanhoeW0zNFZzUTJad2Y4QXQvMlk5?=
 =?utf-8?B?dlhyRUNQa3RkTi9ua29EMjloa2JDbTJTU3Y2VTNlNmQxQVVyQThTWTJFZGJx?=
 =?utf-8?B?YUliYkpNdVI1UGY5dFlHUDZrbzh1NDdmME0vTTN6NmdOR1NWUmQwM0kwK2JV?=
 =?utf-8?B?ajdHU1NXdnF3YkY0R1pKK0RTOU9KMWV2WGJpOGY0T3Q1elQ3TW5UMmtzOW9K?=
 =?utf-8?B?WmpsSFRqQXNXWU1KR3QvRDZ0ZUxrd2kwSzQzU3A4RGttR2pwa2xSQ3lEREp5?=
 =?utf-8?B?SGhWRWFkOXFIMldoWGN5b0R1STBSUzFVbTdjNUpDckhsaEdKaHNjTDZLTGtw?=
 =?utf-8?B?cXlvVHdybWppeVpiVUFQdG8vNmhncVJGaVhrcXVsMnZxdnFGaHhuQmdhNUxk?=
 =?utf-8?B?VzJUdTlrVEw3dnpVZml2M0h4djRyYlU5ZjBmNGYrUk0xRFovcnppYjVZcHpl?=
 =?utf-8?B?ZDNZRDlFVGhzU3A2OUhnUEpnTW91Y094ZkxKSEVIRVNENFlFcytBQkVDbUU0?=
 =?utf-8?B?SkN0Q201S0N5emNPZVEyc3FBeExUMGVQbWdlSmRVNkx2UXQyandDMnYwSXZu?=
 =?utf-8?B?T0ZGSm9rRHJ5M1hrclVVUTlvZkFpU05talc5Z2pKQ2VxTHdLbDN5Z3lLUEpQ?=
 =?utf-8?B?bnR5NWZycUx2SHpZZXUwZzZxbEIyQzVpakY5M1BPcEJyYUlkc0Voc05FNEVT?=
 =?utf-8?B?VENIWHlzTWMyNUViV0ZiYXNPOURpdEtYNkZEbEE1aDlad2svd2M1SWVnaDZa?=
 =?utf-8?B?ZHh3UldjSXRDL01TYnBybFFzbEhyWE1SL0c1Yjl6c05HU1FzSzZmY1E5d21z?=
 =?utf-8?B?VVNiUXhtQXBqL2RKSE9Ia1R1S2N3aHI4akxxNW1DYS9wa1hXWHM2eGxGRE5X?=
 =?utf-8?B?SzZkc0xlWDkvZy9ITU1vcTljV3dRVWRiV0MxZXNYcUVRd2hKbkVQMFJSOUVU?=
 =?utf-8?B?c0oxYWYycU95Y3RGV281UER4L3JMZmxVOGJJZkNuNUwzN3RsMmJPNzJIZTlF?=
 =?utf-8?B?ZW5NU1BIZUp6QWcrbWx1Q3ZWckdjSXFIOS9SYnpXN1o0dzB2YkMwYTA5TzAw?=
 =?utf-8?B?Zk42a2haTVpnT0FrV016Z3NBZlVZWWpBa2VxWFo1Ry9DQ0hDcjZ6QVRQMXIz?=
 =?utf-8?B?WVYzOVhlTUFHdFYzOHJrdGExTUhWODkva1FMaVRwdzRDOGtHRHdXR0ROUTNo?=
 =?utf-8?B?RldHZGlXUVgrSktLRE5kUWlsdDBnRGNyeHdORW10c1g2WkpBZHhlaGU0S2tF?=
 =?utf-8?B?Q0xZOE1WRENMbTNtdklxdjMwRmhTNW1ySDVvTkR6aU0rUy9UbTNsb3EvSDdv?=
 =?utf-8?B?S3BZOWFpQTM3VXg0TFZHZ3B1YTFXbkIzRXl1WGkyWnhQSnh4RkQ2bGFKaVh5?=
 =?utf-8?B?cDdYZE9yNGltYS96N0ZLMWJXaFZwNTBxWnhFTmdFQVRWWGk4SlNDNDBsa1RN?=
 =?utf-8?B?NWJxUjhETTMvaldUN2tJcHMyYUxjNkM2c1dkUElPMFBMY0dOR29oeDBpZnNm?=
 =?utf-8?B?VzRsWmxlV2pEQ3lVVDZLd2RYSGZuYmI4K0NRTjRVVmN5ZFVRWVNaZjFwU1Q1?=
 =?utf-8?B?cWg3clkzejI1TEZiakEybVVsS2FoclVjbkxIelZLQUVaQWRRbjR6b3dTVEJM?=
 =?utf-8?B?N092MVZDbER5WVVKWUVJQkxQakpjU3oyZDdUUm1TVVlSYWI1TktZc0kvczF6?=
 =?utf-8?B?WXhPeGV4NEh1cC9jeUNwRDVKNUViWGlsQVJ5R3NFTVFrTDVIb3E4VWEvL1Vr?=
 =?utf-8?B?S0RTWmdhUFVFZUE0SnNxQkVGdHJRWXNOT2FnK2ppanpyc3E2aVJGN2VqbGZ2?=
 =?utf-8?B?cmdLblZ3cjNKeW1aazVrVE9JWlM3SDlsNWFmNE51M0Q0MHFhdFgzdWdKeFBO?=
 =?utf-8?Q?waWFXKdF/xf1T5LCipDCHens2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b496a3f6-030e-4bea-baea-08dd70c6e7c0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 02:42:55.1846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0IC9rH/e6gE2u72KmsO6rUAKRu3jqZT/71VoEXbt7E2iT4KCdEbG05B23UtccB4n9CRz1WM84/ptDVQxdlNkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9080
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/29/25 09:48, Simon Ser wrote:
> I would prefer these functions to be introduced together with the
> patches adding functions to create objects and adding the new fields.
> That way it's easier to check the symmetry and at no point in the
> series there are memory leaks.

The object creation and new fields are introduced in different patches. 
I divided this patch by introducing these functions in a patch, and 2. 
adding callers when needed to avoid memory leaks.

> 
> Additionally, I would avoid using the name "cleanup", which seems to
> have different semantics: for instance drm_plane_cleanup() doesn't kfree
> the pointer. "destroy" seems more appropriate here.

How about the following changes, i.e., freeing pointer is moved out of 
the cleanup function, and keeping the names.

@@ -173,7 +173,6 @@ static void drm_colorop_cleanup(struct drm_colorop 
*colorop)
         }

         kfree(colorop->state);
-       kfree(colorop);
  }

  /**
@@ -191,6 +190,7 @@ void drm_colorop_pipeline_destroy(struct drm_plane 
*plane)

         list_for_each_entry_safe(colorop, next, &config->colorop_list, 
head) {
                 drm_colorop_cleanup(colorop);
+               kfree(colorop);
         }
  }



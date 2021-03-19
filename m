Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4946E342492
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 19:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7FA6EA75;
	Fri, 19 Mar 2021 18:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700051.outbound.protection.outlook.com [40.107.70.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082EB6EA75;
 Fri, 19 Mar 2021 18:25:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrHmitYSQEdZEysuFOBu6BnxUNnz2U7p9gcbjRyNWjeG3OK3Xuh+5HmElYUXYWB1V0ss5F0U27fWsdz/LRJUrbzlM6B3uKxwJLFLkb0qiRuqY2/8u+8WKqSADTYLD/pKGtDJYXcS0PZB46J2TDlJehZmNJf/vNvazh92peOtHHplPQHQL1Hd3fy9FpF1n1bB2Dkjw8YKerO5SDO3S5ugpkXqQA9esTylQAd9fsmaecevjuXjr0IjBwkoduKOWGwI7F6+8dXmftnhYotyOLoHqUdh2FWMl6saUy3fvtRt7zKHLRMcmRp7LUiyWn3sc38p730BCASVbA9N5kDmY37H2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPXCoGEhLkuRTQ2AqPPC32/NIYW0toBZsyeqxYvrrWw=;
 b=Yf/BW7Snjosk+jRJ0wYkdNOvamFHAAt+/EHMQNwwpL4/Xx0L8zLz6Cy3o3C51LaJOecrQxIvREY8c9c0c6AeCOMsXIQtNl5GT8FBLnvcEpigSgHL5JNAXOEbXOZlr+J4dTswJGgueX/PArOfMRJKkMBiivVPPOqYY8Blfp17QDZuuUA5VlJGBhzqXkbld6yv+55vCQpBqd16cGv8Qra3D8d9YmOPNolxsdWS+g5LRAJB1UHiqdUTMulCYSmrRuW+FvtLIwtz1Ecq5qSwHGIkpyo04yHFuyZDGFPuKBvNXiXQ2z0Z2VbmhsRi+0f6IqOdjE5V5wXCosFd79mXMjVZPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPXCoGEhLkuRTQ2AqPPC32/NIYW0toBZsyeqxYvrrWw=;
 b=ZoctYrJL8Xgi6JrnOAMmmYvqJ35rrDAWSwF2pnq9CHVl7YkptnVzQ0VOl/AQqxjBiKg6kXVBxsYXZjyW99rPfQU2vM1Vq4Qoep/3Dwe9pnoRTeRWZYrQ08NO9r2J2wvswedVaoIsuzX9BiM/kqABYUTHCRf+MWdzkzExa6voYVU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4588.namprd12.prod.outlook.com (2603:10b6:303:2e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Fri, 19 Mar
 2021 18:25:09 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::4987:8b2f:78ca:deb8]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::4987:8b2f:78ca:deb8%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 18:25:09 +0000
Subject: Re: [PATCH 08/19] drm/amd/display/dc/dce80/dce80_resource: Make local
 functions static
To: Lee Jones <lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-9-lee.jones@linaro.org>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <d6248118-efb2-90dd-cf40-9cdff742a147@amd.com>
Date: Fri, 19 Mar 2021 14:25:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210319082428.3294591-9-lee.jones@linaro.org>
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YT1PR01CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::9) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YT1PR01CA0040.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Fri, 19 Mar 2021 18:25:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5bf1be5b-305d-4c02-d228-08d8eb045396
X-MS-TrafficTypeDiagnostic: MW3PR12MB4588:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB4588CFD0ED675771473DE8EE8C689@MW3PR12MB4588.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A8w16ZdPUlEOzhP1wf424+MNsV+Ec23RFrTbbSfUYSj/P4Cr21SBHVT0Xnwzi+avLSED2J+uhRDwYpBbqgN3qQCnzAUdJ96WkAdfd4Z4LZvcMJL51l5Mn2kqCx4K3Gbr3j+noX5HKV6ZPP+sH0fo0rloeEJ77Eki4ZfrXxhd0H9c/2YJAvjjlgQxt58efU3ieCkfoyPKDAnLmrV7Ow0ml/XgxdPJSGE5LR34bbNRzIsk5LlpQzMISMuc3q8GUrffsv4tgvEjNW2d3p3R5j1q8LApeIyTQHHFsimyNsav1v2Bm47eaJmjyhbSZ2QTQZAdbzqV8Y5fElAdzsHrrEjjPvTlSrDfS90MGrelG0y0UObleROWpdzUJNebGy7Z0hvdco1smASb6SiOapChVhhhmTfjhD5vzWbbmamY2Sh0nC5gUsnR2sSGl2QVeynJGkTBIUfD9Is0rvp4TeB3JUBg2mhTkUZcirH+L7k9qOQ+yXvYNcGFT6smLgQ5onPa0ztugaKZ23Y6g6U2zSIucvjYTu9l+81FHzZj61wOLpGHvgdxV496FxNEijEhXcZ3p+Yydz3Pd0phns1CuBlzgcfUaxmL064HmIpmQrAh9eF1eeSys/UUOUblx75z2PlxbNJ88JDNA8thjseA9DtDBXI6h21iD2Bb09tp/DfKGLZ4Iu5fTFbyW55q2bFvhL6Pcg6oZeeXrDzDxXCeilLoaqvZPBGA+WgDXdENphYZW+ZgtIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(186003)(956004)(16526019)(2616005)(38100700001)(16576012)(66946007)(66556008)(6486002)(66574015)(53546011)(316002)(2906002)(5660300002)(83380400001)(31696002)(86362001)(8936002)(54906003)(31686004)(8676002)(36756003)(6666004)(478600001)(44832011)(26005)(4326008)(66476007)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cm8waU9wemNmS2VuNGtvUHE5enVYUmVGM2p5L1FjSWUvNmdVd1A0eDdpOENM?=
 =?utf-8?B?WnYxa0dOTHU4c05tWWVINlNXbExoaGwrSzBCZTNyK1VhMEpPdjNnY0N0UnJ0?=
 =?utf-8?B?YTU0cU1uSWFmdktvNEQ2NTQ0blR2bmR5c0Z4UXROK2tLNUlhWHJuSktUQlRz?=
 =?utf-8?B?em45RVU4K2FCSVl5NklFVEtDb0pYbVc4QlBFcEppeE8rVnJIUm5ZcHB1MTJV?=
 =?utf-8?B?Q1lNSHoxZHRJVHU5NWpEOWxIeElZMWF2K0NoRVR2OXhkVXNDR3l5WGViWFd2?=
 =?utf-8?B?dys1aVJ2WGg5Wk9XdGc2ZklGaEhtVDh4UXQxb2swTnJWa0UxWUd1QjdhTGxy?=
 =?utf-8?B?dGFpWEdUSmxvR0tLeUZIbDdNVkprVEtaQWNNMkVrNUFiTnJCVHQ3SWJEYkRP?=
 =?utf-8?B?UmhaNW8xOXNkM0JFZmdmQ0dFd1dEaVVvNi9VYlBxS0lra09ZZndLTzJmUGlV?=
 =?utf-8?B?UjNhN0gveUlOemZNTzE4RU1iNXBMWHNvallITEUwYjlJeHBWRkxqQ1UvUDNp?=
 =?utf-8?B?Mm9mbGlybWowazMxUjE3RCtvOWdkWEZKbUZwOTVNa3ZMeERFMmFoeWhnOUIy?=
 =?utf-8?B?U0w2Qjc1NkVlWHFHTFNQd3NiQjR4bTVRYlNZcHFlWlU5U05XVFZiWHRTYVZF?=
 =?utf-8?B?QVlPQTdLRE0xbFpJeVJ3L2FwbWRCalQ5aEd2azYweCtUbWE2OFBUS00xRUJl?=
 =?utf-8?B?ZDVhdzRVaUVnRmlWTCtKWUdPclJwSE05NXdEUlJHaUE1SGdvQjJPaVVwZThX?=
 =?utf-8?B?K2hIMGVmaGlFbU9Xc2hrekRtVU4vemdDdE93YkFoQnhVODJFSUlhL0svdFpG?=
 =?utf-8?B?WlNnUGVEcldsMVlHZ0tCdU8yTzFBRWRvcWZhYU84ZWRkZmh5ZU9GZnpmVXd4?=
 =?utf-8?B?TFc5N3ltZ0F6dkQvM29iSlJ1TjZHTUNnZUdsNUNnTExvRDdBeDNpWms1U2Fz?=
 =?utf-8?B?R3dKSVdreUkraGpPQk51WkRhTlhBUzZRWFdqemc1MzUrV3BWVWJ5c0tSS21i?=
 =?utf-8?B?VGhQSGw1bGdHbThGYW1QUXVaRnh4Vzc4SkptdXlPMlhiejJGQS9aZktqcHl2?=
 =?utf-8?B?eThJWU85TlR6aWpZTThvS1RSa2llSDdmdmxXV3c1Nyt6MlUxaTljVk0zM2Vo?=
 =?utf-8?B?ZllzRWZBN3FqTWY0TnQrUzdybVBPMTAxMW1NYmYzWTA2bUplckFFVWpWcUs1?=
 =?utf-8?B?RStTVmFjS1A3VVdLanBtNmVnNlgrMFR2c1pUb1R1Q3NWazl0elNlb2R4VytI?=
 =?utf-8?B?VWhRejArSE5zeG5mMkFTR202eTRCVkZ3QjJlRHBPaFNmNldpWHdSZVhRTHls?=
 =?utf-8?B?aTFNQlB6K3ZOcXF2V0RvcDZ4d1hVWWdMRVhJYUtJd1FHNmFPeVkzZ21XQklm?=
 =?utf-8?B?djd4TU1RSEJHWlhocUJ4eHZVL2tqR2xydzJXRFJGUnltUlAyYkh0cWRVbkdB?=
 =?utf-8?B?UCtvY0x6enRoemtUVTYxMEIrbUdBc2dkODEzd0tRUTFuT2ZPY0M1QjQrKzB5?=
 =?utf-8?B?MUkxWXFUdlc1K0tlOEE1TXM4WVMrK2RjbElRL0VlVVZ5MDFKcVB1OXoxL1RJ?=
 =?utf-8?B?UDNHcmxvWTBvbXBKdGFyUDE4YjdDcVRVMTFYMWJ2YUE0aUg5eHJzd0NxRXlB?=
 =?utf-8?B?T1NGWm1UVzJNMHFCaUlDZm1RbUVUSmxkM3h6Z2RqWDJDZlZTZVBQekNRWVBn?=
 =?utf-8?B?UUVqZzg1eU5namtqeGp4aWNHTys2bG16ZnNTbkRlNHA0SUhycUpHNGpJQUhN?=
 =?utf-8?Q?f9WRpAYCUPk9FZH3sz2+eDxgdGC9bf4V0dFde3E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf1be5b-305d-4c02-d228-08d8eb045396
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 18:25:08.9467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4E7SORHnixYP6zPfU4aIQlm0ccpwVtSd1phalEO288BVBwHUImt5qiKGEA8/ZrxBqAhj2/T31wAtfs/GqkEGog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4588
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDIxLTAzLTE5IDQ6MjQgYS5tLiwgTGVlIEpvbmVzIHdyb3RlOgo+IEZpeGVzIHRoZSBm
b2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5jOjUyNzox
Nzogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2U4MF9hdXhfZW5naW5l
X2NyZWF0ZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX3Jlc291cmNlLmM6NTY1OjIwOiB3YXJu
aW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTgwX2kyY19od19jcmVhdGXigJkg
Wy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
ZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5jOjU4MToyMDogd2FybmluZzogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2U4MF9pMmNfc3dfY3JlYXRl4oCZIFstV21pc3Npbmct
cHJvdG90eXBlc10KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlODAvZGNlODBfcmVzb3VyY2UuYzo3MTU6MjI6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3Rv
dHlwZSBmb3Ig4oCYZGNlODBfbGlua19lbmNvZGVyX2NyZWF0ZeKAmSBbLVdtaXNzaW5nLXByb3Rv
dHlwZXNdCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTgw
L2RjZTgwX3Jlc291cmNlLmM6NzU0OjIyOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUg
Zm9yIOKAmGRjZTgwX2Nsb2NrX3NvdXJjZV9jcmVhdGXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVz
XQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2U4MC9kY2U4
MF9yZXNvdXJjZS5jOjc3ODo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKA
mGRjZTgwX2Nsb2NrX3NvdXJjZV9kZXN0cm954oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlODAvZGNlODBfcmVz
b3VyY2UuYzo4Njg6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2U4
MF92YWxpZGF0ZV9iYW5kd2lkdGjigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5j
OjkxMzoxNjogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2U4MF92YWxp
ZGF0ZV9nbG9iYWzigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+IAo+IENjOiBIYXJyeSBXZW50
bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFt
ZC5jb20+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBD
YzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgo+IENjOiBBbnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNvbT4KPiBDYzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5v
cmc+CgpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+
CgpIYXJyeQoKPiAtLS0KPiAgIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlODAvZGNlODBfcmVz
b3VyY2UuYyAgICB8IDE2ICsrKysrKysrLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX3Jlc291cmNlLmMKPiBpbmRleCA2MTI0NTBm
OTkyNzgyLi43MjVkOTJlNDBjZDMwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX3Jlc291cmNlLmMKPiBAQCAtNTI2LDcgKzUyNiw3
IEBAIHN0YXRpYyBzdHJ1Y3Qgb3V0cHV0X3BpeGVsX3Byb2Nlc3NvciAqZGNlODBfb3BwX2NyZWF0
ZSgKPiAgIAlyZXR1cm4gJm9wcC0+YmFzZTsKPiAgIH0KPiAgIAo+IC1zdHJ1Y3QgZGNlX2F1eCAq
ZGNlODBfYXV4X2VuZ2luZV9jcmVhdGUoCj4gK3N0YXRpYyBzdHJ1Y3QgZGNlX2F1eCAqZGNlODBf
YXV4X2VuZ2luZV9jcmVhdGUoCj4gICAJc3RydWN0IGRjX2NvbnRleHQgKmN0eCwKPiAgIAl1aW50
MzJfdCBpbnN0KQo+ICAgewo+IEBAIC01NjQsNyArNTY0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkY2VfaTJjX21hc2sgaTJjX21hc2tzID0gewo+ICAgCQlJMkNfQ09NTU9OX01BU0tfU0hfTElT
VF9EQ0VfQ09NTU9OX0JBU0UoX01BU0spCj4gICB9Owo+ICAgCj4gLXN0cnVjdCBkY2VfaTJjX2h3
ICpkY2U4MF9pMmNfaHdfY3JlYXRlKAo+ICtzdGF0aWMgc3RydWN0IGRjZV9pMmNfaHcgKmRjZTgw
X2kyY19od19jcmVhdGUoCj4gICAJc3RydWN0IGRjX2NvbnRleHQgKmN0eCwKPiAgIAl1aW50MzJf
dCBpbnN0KQo+ICAgewo+IEBAIC01ODAsNyArNTgwLDcgQEAgc3RydWN0IGRjZV9pMmNfaHcgKmRj
ZTgwX2kyY19od19jcmVhdGUoCj4gICAJcmV0dXJuIGRjZV9pMmNfaHc7Cj4gICB9Cj4gICAKPiAt
c3RydWN0IGRjZV9pMmNfc3cgKmRjZTgwX2kyY19zd19jcmVhdGUoCj4gK3N0YXRpYyBzdHJ1Y3Qg
ZGNlX2kyY19zdyAqZGNlODBfaTJjX3N3X2NyZWF0ZSgKPiAgIAlzdHJ1Y3QgZGNfY29udGV4dCAq
Y3R4KQo+ICAgewo+ICAgCXN0cnVjdCBkY2VfaTJjX3N3ICpkY2VfaTJjX3N3ID0KPiBAQCAtNzE0
LDcgKzcxNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZW5jb2Rlcl9mZWF0dXJlX3N1cHBvcnQg
bGlua19lbmNfZmVhdHVyZSA9IHsKPiAgIAkJLmZsYWdzLmJpdHMuSVNfVFBTM19DQVBBQkxFID0g
dHJ1ZQo+ICAgfTsKPiAgIAo+IC1zdHJ1Y3QgbGlua19lbmNvZGVyICpkY2U4MF9saW5rX2VuY29k
ZXJfY3JlYXRlKAo+ICtzdGF0aWMgc3RydWN0IGxpbmtfZW5jb2RlciAqZGNlODBfbGlua19lbmNv
ZGVyX2NyZWF0ZSgKPiAgIAljb25zdCBzdHJ1Y3QgZW5jb2Rlcl9pbml0X2RhdGEgKmVuY19pbml0
X2RhdGEpCj4gICB7Cj4gICAJc3RydWN0IGRjZTExMF9saW5rX2VuY29kZXIgKmVuYzExMCA9Cj4g
QEAgLTc1Myw3ICs3NTMsNyBAQCBzdGF0aWMgc3RydWN0IHBhbmVsX2NudGwgKmRjZTgwX3BhbmVs
X2NudGxfY3JlYXRlKGNvbnN0IHN0cnVjdCBwYW5lbF9jbnRsX2luaXRfZAo+ICAgCXJldHVybiAm
cGFuZWxfY250bC0+YmFzZTsKPiAgIH0KPiAgIAo+IC1zdHJ1Y3QgY2xvY2tfc291cmNlICpkY2U4
MF9jbG9ja19zb3VyY2VfY3JlYXRlKAo+ICtzdGF0aWMgc3RydWN0IGNsb2NrX3NvdXJjZSAqZGNl
ODBfY2xvY2tfc291cmNlX2NyZWF0ZSgKPiAgIAlzdHJ1Y3QgZGNfY29udGV4dCAqY3R4LAo+ICAg
CXN0cnVjdCBkY19iaW9zICpiaW9zLAo+ICAgCWVudW0gY2xvY2tfc291cmNlX2lkIGlkLAo+IEBA
IC03NzcsNyArNzc3LDcgQEAgc3RydWN0IGNsb2NrX3NvdXJjZSAqZGNlODBfY2xvY2tfc291cmNl
X2NyZWF0ZSgKPiAgIAlyZXR1cm4gTlVMTDsKPiAgIH0KPiAgIAo+IC12b2lkIGRjZTgwX2Nsb2Nr
X3NvdXJjZV9kZXN0cm95KHN0cnVjdCBjbG9ja19zb3VyY2UgKipjbGtfc3JjKQo+ICtzdGF0aWMg
dm9pZCBkY2U4MF9jbG9ja19zb3VyY2VfZGVzdHJveShzdHJ1Y3QgY2xvY2tfc291cmNlICoqY2xr
X3NyYykKPiAgIHsKPiAgIAlrZnJlZShUT19EQ0UxMTBfQ0xLX1NSQygqY2xrX3NyYykpOwo+ICAg
CSpjbGtfc3JjID0gTlVMTDsKPiBAQCAtODY3LDcgKzg2Nyw3IEBAIHN0YXRpYyB2b2lkIGRjZTgw
X3Jlc291cmNlX2Rlc3RydWN0KHN0cnVjdCBkY2UxMTBfcmVzb3VyY2VfcG9vbCAqcG9vbCkKPiAg
IAl9Cj4gICB9Cj4gICAKPiAtYm9vbCBkY2U4MF92YWxpZGF0ZV9iYW5kd2lkdGgoCj4gK3N0YXRp
YyBib29sIGRjZTgwX3ZhbGlkYXRlX2JhbmR3aWR0aCgKPiAgIAlzdHJ1Y3QgZGMgKmRjLAo+ICAg
CXN0cnVjdCBkY19zdGF0ZSAqY29udGV4dCwKPiAgIAlib29sIGZhc3RfdmFsaWRhdGUpCj4gQEAg
LTkxMiw3ICs5MTIsNyBAQCBzdGF0aWMgYm9vbCBkY2U4MF92YWxpZGF0ZV9zdXJmYWNlX3NldHMo
Cj4gICAJcmV0dXJuIHRydWU7Cj4gICB9Cj4gICAKPiAtZW51bSBkY19zdGF0dXMgZGNlODBfdmFs
aWRhdGVfZ2xvYmFsKAo+ICtzdGF0aWMgZW51bSBkY19zdGF0dXMgZGNlODBfdmFsaWRhdGVfZ2xv
YmFsKAo+ICAgCQlzdHJ1Y3QgZGMgKmRjLAo+ICAgCQlzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQp
Cj4gICB7Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

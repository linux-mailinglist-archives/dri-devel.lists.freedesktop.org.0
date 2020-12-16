Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B442DC34C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 16:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE156E14B;
	Wed, 16 Dec 2020 15:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8726E14B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 15:41:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJfHHUZ7GdiFFa0c4HfeH2fFIypZYONSO4ZNAL5WM8fxRpP+pAv5pnrp4dJMXu1UNz1MxGyWPybDpieQbqroXESvbiNCJwGoEdyRcms2ulnKNs1LMZyLug3NuDlF+flQPkKwspCndUfOIs/8xGnaho2ja5waq9lre/ylg2YqS9G2TJLl3gP7lDJeiWgZbpSJjhnyA5vqVMcNHSag20gA1A2jNDh/VEPMQRt7LrMQpXP2RpFIkrYv8m5uznTmaJvc8wKE4MyGMH1f3D6vLkrCWWOImBMSHRuwzjRprdOeNxHE1M7znzKPTihCZ4PXJvjJNW0CstK+XLmzt/GJ6Q2k6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExEk96TVdnEUqocOQr4dSugmbGRcB/wl9j5GXomRnnM=;
 b=QgunISjJDOBY+l2YLH0NHVaT6JEWYZxJJaEKV+amj3DUbGPR5xUDqJDqHpCDGj7ZvhjIfQYqtPdqVvOCqRTSwfWytfsyd1GM2lFISNLcqY3VqKOnxbdZrP2b4JogW81GrKCMRrvBrXeSUu/FI0eD3AA/TgJl7sNr+eNA4Xxm/qjHqLtd+uhP48nHwc/z0IoJjwr61wogxaLqCV9MRzq/Eegb2xjjOrJLcjg6t4aiZCpD9ILKS0osnGx7kgsjc1eatQ+CKOSEWUsrbRso/zEJJrrI/IVKFDT9mrgP4CVHbjNx2kKOVf02n6hUUk0rr53L/O+zHy++FTxDM8B8Poq60w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExEk96TVdnEUqocOQr4dSugmbGRcB/wl9j5GXomRnnM=;
 b=pu/cRu2Voc3ZlA8r5D1lwEI3U80n6rQiY96U+04IwG8C1bi0nILqDwM6zKAm24VpM9StcnK/EiqwwQ8GfNU+5745iinAUzk230K8/XBUkVhgLvIBRjBrhesn4eG1WqSh5YDT8ob47/bJlq7gcD2aecRaodoQp1f4gwyfnW8hmrw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4913.namprd12.prod.outlook.com (2603:10b6:208:1c7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.25; Wed, 16 Dec
 2020 15:41:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 15:41:04 +0000
Subject: Re: [PATCH] drm/ttm: fix unused function warning
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: Martin Peres <martin.peres@mupuf.org>, Arnd Bergmann <arnd@kernel.org>,
 Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Madhav Chauhan <madhav.chauhan@amd.com>
References: <20201204165158.3748141-1-arnd@kernel.org>
 <3a55c203-57dd-79f3-99ec-6bdeafaba157@mupuf.org>
 <1589a0e4-a337-a24a-720f-09587939e94a@amd.com>
Message-ID: <c9f9b966-6894-dd70-373d-04378e76ae36@amd.com>
Date: Wed, 16 Dec 2020 16:40:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1589a0e4-a337-a24a-720f-09587939e94a@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0130.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0130.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 15:41:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cb3aa6cf-1e53-47af-cfcd-08d8a1d8ffad
X-MS-TrafficTypeDiagnostic: BL0PR12MB4913:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4913704EEE569B31C94215FB83C50@BL0PR12MB4913.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mORYAkcm1l5k5S850M882IZCv466iujxbAvLsU1OVbB87/o+55eM5LcPqMJgCZO5z7XX7v5PhCAhor0SNbMeQ4sKY/ACP8Uz02OHN+UE9eYEPnwjTf4+Gwe8cdTKYgV8GRp6P4V+WLlODs4vvoLaoBo5s7l5517PkU8re5sid6xHsuvuBxZWs+VVaOhp51Wy23jUv0IHB992ltm/ZPHIEa7APuL7e/ahho5PBnztYLZSEq3KL4OwHPgmnbBQqUTiBy37qNLns2XYXjHxr6GGi/6xn1UKDnQUSvp2dMRfun11ewYu2ej3BTv4FgpuOB6RMn+xc/LjFmq5g8UZm993SS4wMfS3rwS4BTEUPMUxZN3cnixfrPC5hDwEnoIIcGkAMhugVOCYHOt0EsJhpg9Bsouc/UPXUHV5FVHWsXHxqJ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(186003)(16526019)(316002)(54906003)(66556008)(2906002)(53546011)(83380400001)(66574015)(2616005)(5660300002)(6636002)(66476007)(6486002)(66946007)(8676002)(4326008)(8936002)(31686004)(478600001)(36756003)(110136005)(86362001)(52116002)(31696002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aEdpNGJVaXlpY014UUMwVkxXV0V2Y1U3eWpFWFBJQ1R4R3V2S0hGcFA0SUdD?=
 =?utf-8?B?UEJZRkVpZXp2WEZqYkVWRzBSWjlCOG1RSXRVb0NHd1hwTUlFdjg5bUpGSmhN?=
 =?utf-8?B?NWJ3MHZQS0xUamhqSjlQZDNPNnhtQ3pFYjdTY0tPbWtoVkcydUtFNnhQV2lm?=
 =?utf-8?B?UTFqUGlwOFlwWi9EWTFwQnB0MzBQMXdGMEU4TDNub1h4RnNUajF0M1o3b0ZN?=
 =?utf-8?B?b2M4VHZZVEJaUVlwQ3A2SFA4WkVJbWxya3VwOFVHa1BhVXIwRmZSU1JCbXk4?=
 =?utf-8?B?cEtMa0p1QzltSUhYeVB4dWFWaGZwK21vblF3bEcycnQwOG1yUHRwc3I2TFAv?=
 =?utf-8?B?SVJ6OWtWVTZTY1Y3RGVuaHpIb2J4QkY5NzlpblZXcXlmd011RVVGM2xVVUZM?=
 =?utf-8?B?N1ZjVXJnZzZ2ZVlMTW9aS1VDZjlLQTFzRkJ4ZS9LYWFEUFc0M1NWeXlDZ0lU?=
 =?utf-8?B?SkJudE1XSHhmVVJJS3o3TzV5TkN1ckFTcjI0Smd0aloyM2tUSEJvSjhoU0R5?=
 =?utf-8?B?eGpwcE1LaGRQMlVnd2ZINEVOZXpGRmdoejB3NnRxaERUK04xSzZDcGpCSGRN?=
 =?utf-8?B?ak9rbDNvaWd5UmNDMFU3NGdXSWtmUXNXMGJKMk9KUlBTNXI2Nk1OMkFkaHdr?=
 =?utf-8?B?M0ZMQlB5cGVBZUJrR1FqUjVEOGkySmNwQWl4ejBHQlAxWmQ1WFhFS1IyM0RE?=
 =?utf-8?B?V1o5YUVDRXRyWE03bEkvNjdkQ05jM3ppc25wTVhMdkxyb0wvYmg2SGZiUmhK?=
 =?utf-8?B?SjRSODBIMHhUYlRSazZ6aDJDbFVTY0E4ckVQYXBuTk5uNitRejZCMm5ubjRh?=
 =?utf-8?B?VVY1NFJ4elM1Z21SWGFSLzR6dlJ1YXRxYmhhSElyTkphNEFwVHlYaHZmOVd3?=
 =?utf-8?B?Y3QrQ3VXQ2xqUzFEd2FBZHJCREFXTVRRbFRuS1lmQ2ZHS2VXQVZoTUZiRlNk?=
 =?utf-8?B?bktYcU1IVldUbzVydFY2Q05UdlB3a0wwTk5kMjBpK1V6SERmZnU1SVFXWEhP?=
 =?utf-8?B?T24rNU9zdkRjKy9CbVJjQlF0OWluM0RYeDgybkhCZXVMT1ZVaU1odGtjaUJ0?=
 =?utf-8?B?N24xYWwyOGVXdFpjL29XbWNRY1ZWZ0JmM1AvTmorNkdNejhjTXQvOU5pR3F2?=
 =?utf-8?B?WXVpbWUyT2JRM2RvZ2hCSFZBbzNOdnBKb0ExZzJiYVd0ZkFXMjZSTTZ6ODlG?=
 =?utf-8?B?NkhqTEdqbjE0ZDZiL0gwaUgwYjlmTkJzWEtRSDFya3VCQzBHSXBqZkc2WVkv?=
 =?utf-8?B?eTRBSjJtTFpiTStKTUplekl1bGtiYXFPYWJQcnpVWklRUGJOUFN3TVd5Z3hr?=
 =?utf-8?B?dUpqYXlwajJ4b3Nxb0tNRGdrYWVaWUVBMWYyZDl5L3FKZGFTcHdyZUh1ZGM4?=
 =?utf-8?B?QURJSFpwT1BFT3VUNUU3NWg3eWtSbks1M2hmK0xPRmZPTUdZaTBqQ0ZhZExF?=
 =?utf-8?Q?cYtbAjOU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 15:41:04.6474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3aa6cf-1e53-47af-cfcd-08d8a1d8ffad
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lu+SZFT8mXzPEOiQknk6uqeicPDSruJICzTabdOwByFQMKtGDDfk8QDMAoeb1KWc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4913
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMTIuMjAgdW0gMTA6NDMgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFtIDA4LjEy
LjIwIHVtIDA5OjE4IHNjaHJpZWIgTWFydGluIFBlcmVzOgo+PiBPbiAwNC8xMi8yMDIwIDE4OjUx
LCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+Pj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4KPj4+Cj4+PiB0dG1fcG9vbF90eXBlX2NvdW50KCkgaXMgbm90IHVzZWQgd2hlbiBkZWJ1
Z2ZzIGlzIGRpc2FibGVkOgo+Pj4KPj4+IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYzoy
NDM6MjE6IGVycm9yOiB1bnVzZWQgZnVuY3Rpb24gCj4+PiAndHRtX3Bvb2xfdHlwZV9jb3VudCcg
Wy1XZXJyb3IsLVd1bnVzZWQtZnVuY3Rpb25dCj4+PiBzdGF0aWMgdW5zaWduZWQgaW50IHR0bV9w
b29sX3R5cGVfY291bnQoc3RydWN0IHR0bV9wb29sX3R5cGUgKnB0KQo+Pj4KPj4+IE1vdmUgdGhl
IGRlZmluaXRpb24gaW50byB0aGUgI2lmZGVmIGJsb2NrLgo+Pj4KPj4+IEZpeGVzOiBkMDk5ZmM4
ZjU0MGEgKCJkcm0vdHRtOiBuZXcgVFQgYmFja2VuZCBhbGxvY2F0aW9uIHBvb2wgdjMiKQo+Pj4g
U2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4KPj4gVGhhbmtz
IEFybmQhIFRoZSBwYXRjaCBsb29rcyBnb29kIHRvIG1lOgo+Pgo+PiBSZXZpZXdlZC1ieTogTWFy
dGluIFBlcmVzIDxtYXJ0aW4ucGVyZXNAbXVwdWYub3JnPgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCkkndmUganVzdCBwdXNoZWQg
dGhhdCB0byBkcm0tbWlzYy1uZXh0LWZpeGVzLgoKQ2hyaXN0aWFuLgoKPgo+Pgo+Pj4gLS0tCj4+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMgfCAyOSArKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE1
IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9wb29sLmMgCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+Pj4gaW5kZXgg
NTQ1NWIyMDQ0NzU5Li43YjJmNjA2MTY3NTAgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9wb29sLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wu
Ywo+Pj4gQEAgLTIzOSwyMSArMjM5LDYgQEAgc3RhdGljIHN0cnVjdCBwYWdlICp0dG1fcG9vbF90
eXBlX3Rha2Uoc3RydWN0IAo+Pj4gdHRtX3Bvb2xfdHlwZSAqcHQpCj4+PiDCoMKgwqDCoMKgIHJl
dHVybiBwOwo+Pj4gwqAgfQo+Pj4gwqAgLS8qIENvdW50IHRoZSBudW1iZXIgb2YgcGFnZXMgYXZh
aWxhYmxlIGluIGEgcG9vbF90eXBlICovCj4+PiAtc3RhdGljIHVuc2lnbmVkIGludCB0dG1fcG9v
bF90eXBlX2NvdW50KHN0cnVjdCB0dG1fcG9vbF90eXBlICpwdCkKPj4+IC17Cj4+PiAtwqDCoMKg
IHVuc2lnbmVkIGludCBjb3VudCA9IDA7Cj4+PiAtwqDCoMKgIHN0cnVjdCBwYWdlICpwOwo+Pj4g
LQo+Pj4gLcKgwqDCoCBzcGluX2xvY2soJnB0LT5sb2NrKTsKPj4+IC3CoMKgwqAgLyogT25seSB1
c2VkIGZvciBkZWJ1Z2ZzLCB0aGUgb3ZlcmhlYWQgZG9lc24ndCBtYXR0ZXIgKi8KPj4+IC3CoMKg
wqAgbGlzdF9mb3JfZWFjaF9lbnRyeShwLCAmcHQtPnBhZ2VzLCBscnUpCj4+PiAtwqDCoMKgwqDC
oMKgwqAgKytjb3VudDsKPj4+IC3CoMKgwqAgc3Bpbl91bmxvY2soJnB0LT5sb2NrKTsKPj4+IC0K
Pj4+IC3CoMKgwqAgcmV0dXJuIGNvdW50Owo+Pj4gLX0KPj4+IC0KPj4+IMKgIC8qIEluaXRpYWxp
emUgYW5kIGFkZCBhIHBvb2wgdHlwZSB0byB0aGUgZ2xvYmFsIHNocmlua2VyIGxpc3QgKi8KPj4+
IMKgIHN0YXRpYyB2b2lkIHR0bV9wb29sX3R5cGVfaW5pdChzdHJ1Y3QgdHRtX3Bvb2xfdHlwZSAq
cHQsIHN0cnVjdCAKPj4+IHR0bV9wb29sICpwb29sLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtIHR0bV9jYWNoaW5nIGNhY2hpbmcsIHVuc2lnbmVkIGlu
dCBvcmRlcikKPj4+IEBAIC01NDMsNiArNTI4LDIwIEBAIHZvaWQgdHRtX3Bvb2xfZmluaShzdHJ1
Y3QgdHRtX3Bvb2wgKnBvb2wpCj4+PiDCoCBFWFBPUlRfU1lNQk9MKHR0bV9wb29sX2ZpbmkpOwo+
Pj4gwqAgwqAgI2lmZGVmIENPTkZJR19ERUJVR19GUwo+Pj4gKy8qIENvdW50IHRoZSBudW1iZXIg
b2YgcGFnZXMgYXZhaWxhYmxlIGluIGEgcG9vbF90eXBlICovCj4+PiArc3RhdGljIHVuc2lnbmVk
IGludCB0dG1fcG9vbF90eXBlX2NvdW50KHN0cnVjdCB0dG1fcG9vbF90eXBlICpwdCkKPj4+ICt7
Cj4+PiArwqDCoMKgIHVuc2lnbmVkIGludCBjb3VudCA9IDA7Cj4+PiArwqDCoMKgIHN0cnVjdCBw
YWdlICpwOwo+Pj4gKwo+Pj4gK8KgwqDCoCBzcGluX2xvY2soJnB0LT5sb2NrKTsKPj4+ICvCoMKg
wqAgLyogT25seSB1c2VkIGZvciBkZWJ1Z2ZzLCB0aGUgb3ZlcmhlYWQgZG9lc24ndCBtYXR0ZXIg
Ki8KPj4+ICvCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeShwLCAmcHQtPnBhZ2VzLCBscnUpCj4+
PiArwqDCoMKgwqDCoMKgwqAgKytjb3VudDsKPj4+ICvCoMKgwqAgc3Bpbl91bmxvY2soJnB0LT5s
b2NrKTsKPj4+ICsKPj4+ICvCoMKgwqAgcmV0dXJuIGNvdW50Owo+Pj4gK30KPj4+IMKgIMKgIC8q
IER1bXAgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGRpZmZlcmVudCBwb29sIHR5cGVzICovCj4+PiDC
oCBzdGF0aWMgdm9pZCB0dG1fcG9vbF9kZWJ1Z2ZzX29yZGVycyhzdHJ1Y3QgdHRtX3Bvb2xfdHlw
ZSAqcHQsCj4+Pgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7CE2E9F70
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 22:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F087B88F58;
	Mon,  4 Jan 2021 21:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690082.outbound.protection.outlook.com [40.107.69.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165A888F58;
 Mon,  4 Jan 2021 21:21:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgntQEqIEzPJSRpcmjT1K5BeeQLhEqYNr+dbKsUYxYpsKMiSFOmU4Aw/RyiYAKWJT6fBxQV9HXQX59wXM6IGSWgtoUiRki4WYKc5a+X+SVr5qcrwrWVOVNCv/m+fXgkrMyC1x4BDDTkvyql8s4eh8TnjB4HbKh7enQXhjsQin0B2w96sTpQ1LVwL93qiaFBnBsa+d222bLkzzrEqYrf8kR3Ntuoz/jR6I3yUx8Mkq7m1fJyoWrNgnWFvfr8hRo9+WWxCfvz5frE7Kzo7BN65AOAZejkFMUiJbUbHFdOx5XitTlh9x47fkpU8VoHEOa3wXQe6ssLzdncYu7wuZBLRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqdB8fQuLpeSrFrxPyhyLRjF/TOCt+A5eDmSInEFKRY=;
 b=kJmeq0mVsEFqjjZrqSwYGKay+DYre74f4YmQv+ooykXQpSpy45VYtQU8iHYU/X8txWADzKRimL0TBp5X0oScilBH/E5V4h7k5oRVnXDPizg52HGNJrEHKBY5y/XFxPF1veqT7atKus3BkkpVx4N3TJknGZgcsS2haQa4YY4ieGYVJMkNo5a3HtoVgvcd11qOs5yh87rKcn8Y1mDe3tkWPSpQYyx3cv1jMs/F/TQDTH0mpnk6/y5r7Rx9Tt2AjXlqGYl/WYzuG5WK6c5Q+E2gTQJG82RpCflPt3btLhKJwf++N9NQA7Qy+7tY0u5CSQ3+leKM6ZcRCgVpVbAWvn+58w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqdB8fQuLpeSrFrxPyhyLRjF/TOCt+A5eDmSInEFKRY=;
 b=e7IZHH1y7ByaNAsB8cPEjKHeI3YIOXA3op0bSRlHQMU9zmgaReUVS2qVHXimCNdeQbHg/Lpp2tJMZKGV16WfauQ8v0wSlPk8ov0Swf/mvJDeOV5RVtFXxCCTcOUgxWk6dISwb8eVQKRQ7FvRXVhNr36GWdEpa4g2Y7GyoBIDW1Y=
Authentication-Results: basnieuwenhuizen.nl; dkim=none (message not signed)
 header.d=none;basnieuwenhuizen.nl; dmarc=none action=none
 header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BY5PR12MB3795.namprd12.prod.outlook.com (2603:10b6:a03:1a9::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Mon, 4 Jan
 2021 21:20:58 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::c415:a6:f78f:82f5]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::c415:a6:f78f:82f5%6]) with mapi id 15.20.3676.035; Mon, 4 Jan 2021
 21:20:58 +0000
Subject: Re: [PATCH AUTOSEL 5.4 006/130] drm/amd/display: Do not silently
 accept DCC for multiplane formats.
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20201223021813.2791612-1-sashal@kernel.org>
 <20201223021813.2791612-6-sashal@kernel.org>
 <MN2PR12MB448885CD6421AD53DCF46EE8F7D80@MN2PR12MB4488.namprd12.prod.outlook.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <8cc65fcc-626e-6012-8d5e-0a0c5d608fab@amd.com>
Date: Mon, 4 Jan 2021 16:20:55 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <MN2PR12MB448885CD6421AD53DCF46EE8F7D80@MN2PR12MB4488.namprd12.prod.outlook.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.211]
X-ClientProxiedBy: YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::6) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.19 via Frontend Transport; Mon, 4 Jan 2021 21:20:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 317d2734-357e-4199-c2c7-08d8b0f6a14d
X-MS-TrafficTypeDiagnostic: BY5PR12MB3795:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB3795737559A5A362EDFD7FBEECD20@BY5PR12MB3795.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o7W+vMPbmXOo/HEmIOeCmYl4451ppULJ8xJSubLKxCXPnjHsN4pLXOCI5i33yw2h2q/wU8glz8EZUoPKn6NcblWh6MhxSNHqdtbj5YAIod0Sqt6C4YZCJLsDc2SIcdfRT3DNAOUuWTWE3Rc7uQxIYGnGY93D7FcRSd1KNv0NJUZDdQZKNIruDjR4MmL6K5xVP/6ukCFcp5pdlrnlDdFi2xxaugCGpkyHAzC8HLiT1oaZ6pml0ZLoOVvt7qFf355lMe6Q+uQPlr8e3e7GSonzc13hpUIonTykbvQKC8U7H590UulBdAdVvv+rkux1V8FGChH3MwWqeaZaigA6rjk1wGyLBjd83BmDVRXJiuxCcDSdGFEOsjv1lOuIMBJrH2u30RCi95UsOq6vwKymGTSHpAyKKLM86fY1R4ai7vhPV0ARwV2DjvL2yLgtmTFw093XruFUzouCxzaygm7JLe2bZ9PB4KvdXLVaH2Fvvhmqlu/S1/mc8XhzrkmJQDDqJ4P/BvkJy6OmxFOS+SdMLLg+fg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(53546011)(45080400002)(26005)(4001150100001)(86362001)(478600001)(5660300002)(8676002)(2906002)(6486002)(16526019)(54906003)(110136005)(52116002)(186003)(8936002)(316002)(2616005)(956004)(31686004)(966005)(16576012)(66476007)(66556008)(31696002)(83380400001)(36756003)(4326008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NEJ4UGZxU29KZWlQa2haTlZKR21WRGNwSWJES3JxOUE1eGpnV3h3T0t5dnJP?=
 =?utf-8?B?MHA4bU50cCtZSktyNzRhYi9IbUlnenpvazVGTllkc1h0aHl3VGs3OU5pWTg0?=
 =?utf-8?B?b202YWVXVzFER0djUmhhV2JNaWxSV29ZRlI4YUZCNlQxZFlDU1BaWndDeDhT?=
 =?utf-8?B?SVBpUVArV0Foa2dQeGpIMVRSM251ZStBOUdRU2MwSlh3OFRNUHRkRWJJeVNZ?=
 =?utf-8?B?RWF6WEpWenE5ZjhvVnM3MkI1dkpDbTdJZm9rL3NWdUhVMEVIOTNRbVZQeEZv?=
 =?utf-8?B?ZFFKMmh0Z2l6NmhCRkhOSFVjcG9JZVMyOTVKODc2Z3BsN2tmOVVTbGdWWEZz?=
 =?utf-8?B?ZlpkdC9kdTNka3owVjhYdDVLZURuQWJpRjBpa2dRb3luNlp1dzYwSnh1d1dw?=
 =?utf-8?B?STBhNlpFUmhEMDVWdVkyUU9MaDI0d2JFM0tnMS96REZQczlOYk5lalZ5WkZ0?=
 =?utf-8?B?WlNldFlxanJHRU1TYjVKRmxnMkJDcGp5Wm44dlRKSkhXeWp5UlpQam9Cckhh?=
 =?utf-8?B?Rk1SZTdjSEFwOGRvMDBiNzlZUks5cFlmWFc5cnZ5ekgwOXIvT3FwcVYxNmM0?=
 =?utf-8?B?YWRCUDRHV2FMWDhNUk1TcGlmd2hzaFN0cm5VOFgxMGppR1Y1OW15ZjR2Wmsz?=
 =?utf-8?B?YUhTM0pGT2ErS3huUEpZRitvbHJ0VkFzb2dBZGxPalF4dzk5RTRUbHRLdXo2?=
 =?utf-8?B?WE53ZVZ5Z1AxcVBzd0czQ3BnOXFSbzNvZndqKytXSWs4R1pMUU56Wk9zaUNZ?=
 =?utf-8?B?NFhRWmJteVRTbmFEMG9NTFZ0NzR0eWdPWEIrQ2dCYWRIaVZsQVVWd2ZNSGlC?=
 =?utf-8?B?ejFoT2NXZWlDYlhHejllZXVyZXhoUy9MNjl6MEVmMjlYQzY1aXFMZjJsVkpV?=
 =?utf-8?B?UjVuSWlDZUovSDJIS1V2OXdPOXZicUhKZ0l1dEh3R1dNUkRjYnZCN0tVZ2hx?=
 =?utf-8?B?N0NBa2MrQkxnc01DaUVmS3NrNisvU0dCVmpneFcyL05mM0dncmF4a1lOVVhH?=
 =?utf-8?B?UHExMngwd0FpUmorYzB1YVFUNHV4dHcrVm5sNnZzUlYyblppeTIwcXo0UXFz?=
 =?utf-8?B?VXh4bThWdEs3UEphdFZWbzhOSUN1a0ZuSkRjVTBvQjlBbVFONzl3ZWxNU2hE?=
 =?utf-8?B?WGorMU9RNjdyejd5Q0VYR0szR2lJd1BkQW95bWhtVUVwemIyaDBVWXhIS2kx?=
 =?utf-8?B?MWdWcDhXWEZ3K09sOHJOVlZENDBNWDdXSHNRSFh3TnV2ZG9iZVRIVUJsM2Nz?=
 =?utf-8?B?U0ZtM2tKZnlpV2pkZklSYXZKSGpMM1VhcjYyMHcvOW5ncno2NW9iWmd6VzBm?=
 =?utf-8?Q?hfE2wKFCmPz2LiRbQqTOJs1Z3sFqEzZAxB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 21:20:58.6587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 317d2734-357e-4199-c2c7-08d8b0f6a14d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Bv+KGrIkZ1gXJgIaUJvxsjxRWkOA/SjD7iqHfWXvUmCefM0iUFwlw7YD24bVR8VsCcPlDXfYulz5pMbDkoqiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3795
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMi0yOSA5OjU0IGEubS4sIERldWNoZXIsIEFsZXhhbmRlciB3cm90ZToKPiBbQU1E
IFB1YmxpYyBVc2VdCj4gCj4gCj4gSSBkb24ndCBrbm93IGlmIHRoZXNlIGZpeGVzIHJlbGF0ZWQg
dG8gbW9kaWZpZXJzIG1ha2Ugc2Vuc2UgaW4gdGhlIAo+IHByZS1tb2RpZmllciBjb2RlIGJhc2Uu
wqAgQmFzLCBOaWNrPwo+IAo+IEFsZXgKCk1lc2Egc2hvdWxkIGJlIHRoZSBvbmx5IHVzZXJzcGFj
ZSB0cnlpbmcgdG8gbWFrZSB1c2Ugb2YgRENDIGFuZCBpdCAKZG9lc24ndCBkbyBpdCBmb3Igdmlk
ZW8gZm9ybWF0cy4gRnJvbSB0aGUga2VybmVsIHNpZGUgb2YgdGhpbmdzIHdlJ3ZlIAphbHNvIG5l
dmVyIHN1cHBvcnRlZCB0aGlzIGFuZCB5b3UnZCBnZXQgY29ycnVwdGlvbiBvbiB0aGUgc2NyZWVu
IGlmIHlvdSAKdHJpZWQuCgpJdCdzIGEgImZpeCIgZm9yIGJvdGggcHJlLW1vZGlmaWVycyBhbmQg
cG9zdC1tb2RpZmllcnMgY29kZS4KClJlZ2FyZHMsCk5pY2hvbGFzIEthemxhdXNrYXMKCj4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gKkZyb206KiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBvbiBiZWhhbGYgb2YgCj4gU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwu
b3JnPgo+ICpTZW50OiogVHVlc2RheSwgRGVjZW1iZXIgMjIsIDIwMjAgOToxNiBQTQo+ICpUbzoq
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc+OyAKPiBzdGFibGVAdmdlci5rZXJuZWwub3JnIDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+
ICpDYzoqIFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz47IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcgCj4gPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyAKPiA8YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc+OyBCYXMgTmlldXdlbmh1aXplbiAKPiA8YmFzQGJhc25pZXV3ZW5odWl6ZW4ubmw+OyBEZXVj
aGVyLCBBbGV4YW5kZXIgCj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLYXpsYXVza2Fz
LCBOaWNob2xhcyAKPiA8TmljaG9sYXMuS2F6bGF1c2thc0BhbWQuY29tPgo+ICpTdWJqZWN0Oiog
W1BBVENIIEFVVE9TRUwgNS40IDAwNi8xMzBdIGRybS9hbWQvZGlzcGxheTogRG8gbm90IHNpbGVu
dGx5IAo+IGFjY2VwdCBEQ0MgZm9yIG11bHRpcGxhbmUgZm9ybWF0cy4KPiBGcm9tOiBCYXMgTmll
dXdlbmh1aXplbiA8YmFzQGJhc25pZXV3ZW5odWl6ZW4ubmw+Cj4gCj4gWyBVcHN0cmVhbSBjb21t
aXQgYjM1Y2U3YjM2NGVjODBiNTRmNDhhOGZkZjlmYjc0NjY3Nzc0ZDJkYSBdCj4gCj4gU2lsZW50
bHkgYWNjZXB0aW5nIGl0IGNvdWxkIHJlc3VsdCBpbiBjb3JydXB0aW9uLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEJhcyBOaWV1d2VuaHVpemVuIDxiYXNAYmFzbmlldXdlbmh1aXplbi5ubD4KPiBSZXZp
ZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IFJldmll
d2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KPiAtLS0K
PiAgwqBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwg
MiArLQo+ICDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jIAo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYwo+IGluZGV4IGQyZGQzODdjOTVkODYuLmNlNzBjNDJhMmMzZWMgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiBA
QCAtMjczNCw3ICsyNzM0LDcgQEAgZmlsbF9wbGFuZV9kY2NfYXR0cmlidXRlcyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIDA7Cj4gCj4gIMKgwqDCoMKgwqDCoMKgwqAgaWYgKGZvcm1hdCA+PSBTVVJGQUNFX1BJWEVM
X0ZPUk1BVF9WSURFT19CRUdJTikKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gMDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiAK
PiAgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWRjLT5jYXBfZnVuY3MuZ2V0X2RjY19jb21wcmVzc2lv
bl9jYXApCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFM
Owo+IC0tIAo+IDIuMjcuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZs
aXN0aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDQlN0MwMSU3Q2FsZXhhbmRlci5kZXVjaGVyJTQw
YW1kLmNvbSU3Q2ZiOWYyNTgxMzkzZjQ5NGFjZDE3MDhkOGE2ZTkwNWZjJTdDM2RkODk2MWZlNDg4
NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ0Mjg2NzA0NDE1MDAwMCU3Q1Vua25v
d24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pC
VGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1aWXoxRmpUbDZTb1dY
MUI5MXQwTWNkVWFpJTJGelJGOUM4dUJtRSUyQk5RTm9kNCUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPiA8
aHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBz
JTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1k
LWdmeCZhbXA7ZGF0YT0wNCU3QzAxJTdDYWxleGFuZGVyLmRldWNoZXIlNDBhbWQuY29tJTdDZmI5
ZjI1ODEzOTNmNDk0YWNkMTcwOGQ4YTZlOTA1ZmMlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5
OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDQyODY3MDQ0MTUwMDAwJTdDVW5rbm93biU3Q1RXRnBiR1pz
YjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lM
Q0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPVpZejFGalRsNlNvV1gxQjkxdDBNY2RVYWkl
MkZ6UkY5Qzh1Qm1FJTJCTlFOb2Q0JTNEJmFtcDtyZXNlcnZlZD0wPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

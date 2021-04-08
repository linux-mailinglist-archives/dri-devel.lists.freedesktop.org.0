Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70E23587E5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 17:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9716EB24;
	Thu,  8 Apr 2021 15:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABC06EA24;
 Thu,  8 Apr 2021 15:09:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZUDhvHFqHFcJrW4FQOJ2iX39CZ5ClDDB68FFJu5UFWf8QEHWgyIhDFBL9fbi7vSXODWNitSg+X5jf2AL6rehPjGcvUsTKp567vReKdZ4CE8a67FRu+Dm0zLbEEEj1cBOYNxQgiFz/kREDBWWfCW7vd+c4M96DCe8AgzfrAG+dWXj4D+XL2+tBvECDZE8Slic9feB+OUFJX2Wlbxe4m6otDkfqStRcQma6PfwkeuQizrwRIh9wUZ1vMGIoecJYTlYTNgPkxwdyxHZAW16L9UhSTs/w4LaAYk9M7IxZVVWZimSIiuWVGwUCQRIwUwu4R3D8Ruv/OJnybbVnF8h9kbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2V5kcZNFJOFEZuSQU33lytKmPcCcqh1syrAXZP8KLwI=;
 b=He1RWwFk4PHerWhMnFbmjNZQR31AHWN9G84cViQHusaNgB1t6Tj772Ofg3vTA4Z6TkxsTkgvF/2EksSN/PAzVu+SNh3W7c0vswTqEWIaDfWOsP6jAGb/UQJ1HI3nmfgkj/Ge9zlfiAgUAuisrs1Rb0C33PaudND3iP2qTS6w6jhJ/5u70+3tilDWKn8Y/udM851KwZEeKzmMV5rsbOX+fdyg0JMCsD4jvLZvrEZb3CmyjjWt7JeDLyeUKgwtm63FqyxIDQSyIuF3AagG4SpvjcCyw4s/RGeTBn91n625sqnGUTt85GVz73B0YKvIv70vzci3opMRIwkLWEVmWqo3NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2V5kcZNFJOFEZuSQU33lytKmPcCcqh1syrAXZP8KLwI=;
 b=T1cwWWYKWuv36e3fG3/fpn5OKa7g9/Tew1rFzfbBs3wW89QAnruB8EaiXsBS1c15BLNb1VsM8cw6YjX+WKsHWICqIN3UvzRMpAMY84BSqOJp3AipTtvb9QXR8WKDjLD9e7f6jhm7Qvv9XKaAsKf/9UhAWJG2xjrR043hUX9VrQE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW2PR12MB4682.namprd12.prod.outlook.com (2603:10b6:302:e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 15:09:35 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::4987:8b2f:78ca:deb8]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::4987:8b2f:78ca:deb8%8]) with mapi id 15.20.3999.036; Thu, 8 Apr 2021
 15:09:35 +0000
Subject: Re: [PATCH -next] drm/amd/display: Fix the Wunused-function warning
To: Shaokun Zhang <zhangshaokun@hisilicon.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1617885718-2697-1-git-send-email-zhangshaokun@hisilicon.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <e04c678a-d679-1747-e933-a80df493a02c@amd.com>
Date: Thu, 8 Apr 2021 11:09:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <1617885718-2697-1-git-send-email-zhangshaokun@hisilicon.com>
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YT1PR01CA0140.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::19) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YT1PR01CA0140.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Thu, 8 Apr 2021 15:09:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ccfeb93-2ad2-4e81-2540-08d8faa051fb
X-MS-TrafficTypeDiagnostic: MW2PR12MB4682:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB46826B3B38DA9515E60E27AC8C749@MW2PR12MB4682.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VDJks8JENoDxolsarzv0UytUjtjJxU+C/KOJdU0cZjlLmCO2hmy4rB3z83VHrYyqBVXWHW1d3PJRfmuiUx+D8buEvPS10wiTLGzKutY33CNirSmSB07dtabq0+IevJC+v6NizdbMw4T7IUWVmUFw+tTbbEXDJUZt6+P8HiOjmkUZGIbUg8gRXtXjpcWyo9ihijQbXnunEwm2I48i25pxOi/UJNdDV/sCXSnGp9QbIWc60hJGIPgWZKRNzhkXmMB3F63PXEUF5e4f1OFaRctrgtU+8bLzrtXE3gedh0K1PLHj0U1wzU/fYc4TVCGseiM+K0iEhplsCjbEjYuiLFHlkSTX3JBseSGwcaDszqQavwia7mtsWZQ4VMAKLe3wlZLWKWlb3Iw1uHNrj+9S48IPq0MyFfPeVFlsFxh8iu5DoE9+XDcnvBETB9KMMDOCIQMV3AuxrygfgElIuW/px/gPidjHHohCuzoiWEDftRuVn0lF+iGnjucnBAqdm9bwZhR1OlalelZxKCJ84KaLxxAcLcb9k4Iqhyx0eoEJCLCilCQozWiSPOhv/+cJWmHCiYXipxhFZGc9kthcb+kknUsP0B+Z4A36BTJG25sbAdCAskglNPiUBq1uzpJr9WxiHTMotj7becM7XPjdxj9IqQmYccpoiS1S1tb9xBa7cvVwD14APaCyd43tJb9BRaO0J19M8+ZhWtZed6dnngJvscoQCmQpn44Turej1x0GdsM3e0c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(26005)(38100700001)(66476007)(54906003)(2906002)(44832011)(36756003)(83380400001)(6666004)(316002)(478600001)(4326008)(66946007)(956004)(31686004)(86362001)(5660300002)(186003)(6486002)(2616005)(8676002)(31696002)(66556008)(8936002)(53546011)(16576012)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bVgwNjZhWTNQRXBuWm1jVUZLYU9JYlRHaEcyZGxXejFYcll6ZEhNeTZ3Qk5L?=
 =?utf-8?B?dm5KeWxYNWMwRFhDS0pSM09lKytNMVFTZk1LVGp6WDFleEVQWUplbGRhTlpM?=
 =?utf-8?B?VHFScFptVmIxb2FQYi93NzJGTENTK2JMNkFkdnhpTXFjUnRUamovbkg3M2tC?=
 =?utf-8?B?YXpxQjRPOWljNDVIekl5ampGZXk2czhvdjVmejBZS3JnRHRJUHFadXZXK25k?=
 =?utf-8?B?eGlaVUJnbDkyS1ZuSDV4Y0RkbWx3VWtJSEFnWnhoSGR5dVZkcVJpMG0xcWJJ?=
 =?utf-8?B?bWJuZDFYYVBHS0tIaURIR29GTHdVd1d3V0dMVkVIdHM4Yjd6dkZlODE3ak5q?=
 =?utf-8?B?V1pUUEZlckR0K1ZNeDNzOEtmTW1PUlp6R3UxRXRKNjlhMDQ5eUZTNUF1ZDRh?=
 =?utf-8?B?cVZzUUFIazBLdlVOZHU3RjdycGprelRUN0txTjVMWHlIZ2JSM1ZTa1Y5cDdR?=
 =?utf-8?B?Y3BhV1A4bm55WXUxUkVnWFRjWlFRMU9LTk5HR3prSmFDK1RaUmlnazBhcEFR?=
 =?utf-8?B?SW5lUTJHbFFpWTVhWW5qV1dqZWJwZjhmdSsvY0NkVG5kQUN5VUpGSFFNbERK?=
 =?utf-8?B?a015em9lZC9JZnB1eXdER1JzS2REcWtQekxGSmVHWU16dUJ6cm9LQVZ1WlRF?=
 =?utf-8?B?WkpTY2pzWXZrVWhvRWtmd0xHSzZPWlRab0xIUGhkU0FrcjdlMjRNaUhCQXNa?=
 =?utf-8?B?TExrckx0Zzl3ZWxjWm1XMkJLbkxBTmhGVS80alo2TnovZWFDb21xYlU2RjBW?=
 =?utf-8?B?RlZRYkl6K2JpeUZMUTNwa0lVdktLQnMvOUIySmxqMVpvMC9reFUvYm5UTlhm?=
 =?utf-8?B?QnVEVXYvV05rK1hkaUQ5WjVwVWlmbW03eU4vV2xwU2FQOUtQblhOTmY2azlM?=
 =?utf-8?B?OGVORHkwSTlpamdGTXdMbDlNaWpVNytTamx2QUg2N2F3akRYMlZvUVdTZjFu?=
 =?utf-8?B?TVFYb2U5cHlOMUJyQTlRSy9KckFpbHFTbk8xUGY4Y1FPOUI0b2ZObE5lUGhm?=
 =?utf-8?B?ZkEycW9tWS9BUjc0ZEVTdSsrblI0eFRyaWErUWtVSFhwQUJ2UHlKR3l0Qkhv?=
 =?utf-8?B?T3d2bnRmUGdZeEIxTUxKdUpEZmR3QVVOZDNIZlZDSThCcHhXUHNNUEpxbVlh?=
 =?utf-8?B?Rmx3R3NzZkNnUUdUN3UwMnFIWHZuQjdvYnArSFQxQ2czaVl2MGMrVy9BSEx5?=
 =?utf-8?B?RXU1N2NVWkxCeVhqcElNUXlmQk0vRFdjYlJKS2Z2Vi9QZElNL213czluMytZ?=
 =?utf-8?B?dzcxMjg2MVo5dDFlVlNWd2F6Z09QNlVORDAvTUlnbVRjK0F5eWRNTnpmR0sx?=
 =?utf-8?B?YzFJcTUvTC9uL2Z2Njl0VEFKZG5ITGlvZUI3RE1TLzd4R2x1SUwwclRCMXBh?=
 =?utf-8?B?WlNKZHBHSEFTQmFQaU4wSTBoQzBXUWhNdmRzdmtOaG5Sc00wRDVFTE9oRFRT?=
 =?utf-8?B?MjhYWml3bVFid3ZCSHZmV0xGNENFYmlVUWYyUmNQQWNNZlNveDJLZkdNZHpN?=
 =?utf-8?B?Q1Irei8wUnFIbUxxOG1BYUdOSjFRODFDYUxMSFdTZHZvV2F4S2dPaXJnMGZn?=
 =?utf-8?B?ckdUdXJwQlJYTmhUdmVsVGp0Z2NKRTMyU0NyM1lYREpmNnNuOVVGTTVXR0hF?=
 =?utf-8?B?dUFOaGc5THNwellmU3BrYnFRaFprMFU2clhpczhkdjgxVDRYalhzdFoxNVc0?=
 =?utf-8?B?VlZSQlVqUmt6Z2tpYmkrdmtlNW9TMHFJcndmVG1YZk9IdEpjMWc1Vllseits?=
 =?utf-8?Q?oJkOwTGLEsuSEdDaj+Vo9UH29yQTQc7XKG/s6cw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ccfeb93-2ad2-4e81-2540-08d8faa051fb
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 15:09:35.1434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzlKOHcXQXJEcBraB10ia8TF0yLyx5jxkwEqxu4/2WjgGTfXpMtf9EmblbjmBG+FuvblaMx6y37eCrXIrV8VWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB4682
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Solomon Chiu <solomon.chiu@amd.com>, Leo Ma <hanghong.ma@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wNC0wOCA4OjQxIGEubS4sIFNoYW9rdW4gWmhhbmcgd3JvdGU6Cj4gZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmM6OTQxOjEz
OiB3YXJuaW5nOiDigJhkbV9kbXViX3RyYWNlX2hpZ2hfaXJx4oCZIGRlZmluZWQgYnV0IG5vdCB1
c2VkIFstV3VudXNlZC1mdW5jdGlvbl0KPiAgICA5NDEgfCBzdGF0aWMgdm9pZCBkbV9kbXViX3Ry
YWNlX2hpZ2hfaXJxKHZvaWQgKmludGVycnVwdF9wYXJhbXMpCj4gICAgICAgIHwgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IAo+IEZpeGVzOiA4M2IzOWUxZmMzZWEgKCJkcm0v
YW1kL2Rpc3BsYXk6IExvZyBETUNVQiB0cmFjZSBidWZmZXIgZXZlbnRzIikKPiBDYzogTGVvIChI
YW5naG9uZykgTWEgPGhhbmdob25nLm1hQGFtZC5jb20+Cj4gQ2M6IERhbmllbCBXaGVlbGVyIDxk
YW5pZWwud2hlZWxlckBhbWQuY29tPgo+IENjOiBIYXJyeSBXZW50bGFuZCA8SGFycnkuV2VudGxh
bmRAYW1kLmNvbT4KPiBDYzogU29sb21vbiBDaGl1IDxzb2xvbW9uLmNoaXVAYW1kLmNvbT4KPiBD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFNoYW9rdW4gWmhhbmcgPHpoYW5nc2hhb2t1bkBoaXNpbGljb24uY29tPgoKUmV2aWV3ZWQt
Ynk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgoKSGFycnkKCj4gLS0t
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwg
MiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jCj4gaW5kZXggZGFhY2M1Y2M4ZDUxLi41Mjk4ZTVkNDA3NWIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiBAQCAtOTM3
LDYgKzkzNyw3IEBAIHN0YXRpYyBpbnQgZG1fZG11Yl9od19pbml0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQo+ICAgCXJldHVybiAwOwo+ICAgfQo+ICAgCj4gKyNpZiBkZWZpbmVkKENPTkZJ
R19EUk1fQU1EX0RDX0RDTikKPiAgICNkZWZpbmUgRE1VQl9UUkFDRV9NQVhfUkVBRCA2NAo+ICAg
c3RhdGljIHZvaWQgZG1fZG11Yl90cmFjZV9oaWdoX2lycSh2b2lkICppbnRlcnJ1cHRfcGFyYW1z
KQo+ICAgewo+IEBAIC05NjMsNyArOTY0LDYgQEAgc3RhdGljIHZvaWQgZG1fZG11Yl90cmFjZV9o
aWdoX2lycSh2b2lkICppbnRlcnJ1cHRfcGFyYW1zKQo+ICAgCUFTU0VSVChjb3VudCA8PSBETVVC
X1RSQUNFX01BWF9SRUFEKTsKPiAgIH0KPiAgIAo+IC0jaWYgZGVmaW5lZChDT05GSUdfRFJNX0FN
RF9EQ19EQ04pCj4gICBzdGF0aWMgdm9pZCBtbWh1Yl9yZWFkX3N5c3RlbV9jb250ZXh0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgZGNfcGh5X2FkZHJfc3BhY2VfY29uZmlnICpw
YV9jb25maWcpCj4gICB7Cj4gICAJdWludDY0X3QgcHRfYmFzZTsKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

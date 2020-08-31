Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCA3257709
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 12:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F31989FA0;
	Mon, 31 Aug 2020 10:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E6889FA0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 10:00:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSSnEXcod2D/jr4dvMiCYC3XGn2qsiMhqEG43Bfy1PWPpOHT2uN0QxBPe8PEyEsBkWXdeICGFVZKfMavMn2RkRGPzZ8kbgj6Yy741Cml6uWRBFPRW5Sdm50kuZTnd6+kEj+7F03V0SHtIniRVvTEog2nKQARMw84Fn6g7VXIrsVw8RVr9gv9bxEJebbAjfdL5FMAbpsdO7F1cK6UdTSx8KTvYhrAZbiwIgz5+/ElqONRKlYzgpxgLZv6UuDe0hHTYqsxZpj8HbuUIVtBJ9zgM6wa25fLs36yENpX70GSz86iL0Vtvk2hzn34zxu9IS2ydH5lw1ZB0UmU8ji3eklC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/dXd0gLOtRGyZn+qb4Zs2D9iGzoDDXORB0Q3CjEBPo=;
 b=cMe9TbPs4TdVxX6Nsc1w7ShkcGVK+AioLRzuWTD/w6IQi2rAb+OcIywKaGebVwGRqyomPno75lZB6/3MXFDhGZWBaT5FSgrt10M8YXkpc9ezD1+SvkdChQ0JooROC7+A8VkyllEJKJCY3kqu0huA1nMNO+foxYRFV2X9E90LTCg2bG3oAXzzE0NYDluABjq1eqgY397zwNIqxKlY/aUHvvA+h8EOTbHkdtL7WqFoLV+Tg68HKIX+/d+qs0Xs9TzCuTL+/wo22W4hYo4T1j7UFHNxepmpYFQfZ8QmLhqtJ0GGvpkgzH0T4gT6FEoq6XZDZxraDP5FDFxcsbUyiMprJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/dXd0gLOtRGyZn+qb4Zs2D9iGzoDDXORB0Q3CjEBPo=;
 b=zEnJsMZ3aouuZ1lfAF3FpDCTjKqvi+6bmibYAgbPz9U+Ocd0mvMHuEeglgEsvK1BY5zu2nF/l8wUIoiZRVvH4TJcHwkFHD8vk7QLB4MrH89Ms+HlzhvAyJE8n13QMOAthebFxg9/bUXwyu4v4iyimAHX90fqkZydzJFI+qVHqJU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3968.namprd12.prod.outlook.com (2603:10b6:208:16f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.24; Mon, 31 Aug
 2020 10:00:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 10:00:11 +0000
Subject: Re: [PATCH] dma-buf: fix kernel-doc warning in <linux/dma-buf.h>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20200831041655.29796-1-rdunlap@infradead.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b97f98ed-75b7-400c-07d3-89f49c5bb809@amd.com>
Date: Mon, 31 Aug 2020 12:00:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200831041655.29796-1-rdunlap@infradead.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0079.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 AM0PR10CA0079.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Mon, 31 Aug 2020 10:00:10 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 572eee82-1510-4d57-3f0b-08d84d94a652
X-MS-TrafficTypeDiagnostic: MN2PR12MB3968:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3968E90C1E318ADFA77704C583510@MN2PR12MB3968.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K4vQla8zYPi28m/W/FONJFf+avs0Ru/TNVWnYcGCpmc977KL5XZ8E+YNljXSyFBMH55MZVIbf7ax+oJiWYfmUR21mkhToa1+KoO2ZsYxHLylSlJvjlvl097+O0DGhuAhw/wG6DKOf7jz+wSMni81A+urfK/ZpRS7mNcZtRRjY2tsY0wDEWW4+TDIHGhZp8TpuizpdzZ+OamMTGowRbmAEhZYAm00V5pBsiV1mUz1Ou31DTAu0qfx2xSt4X43FyeiHeCwzMQ5cHrspEYYkCLijfaas//g0GOnQKRan/9HSPkEbgba4g8VQmYfD8iBKS9xDRKJBpZb2LEbDcVKrg/CWgtTvPxRhJzyKmDHxX3qbmIpJsCaeu409tIFe1GyW1lg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(6486002)(52116002)(66556008)(66476007)(66946007)(8676002)(6666004)(4326008)(2906002)(186003)(31696002)(66574015)(31686004)(86362001)(54906003)(83380400001)(5660300002)(478600001)(16576012)(316002)(956004)(2616005)(8936002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: MJdxm4X5D+Ut+BPuyYxhFngJdna2sRCCp5ABMCGtHzfLP22x7XGzUNdNF9egp2MCsmm481viGgXCAas4yPZYKsBfCz6jz02mfpRACNnIXzwUPrFkiq2iLU8GmRU3HW+7oMc5ZUdpLQouH47RlLrSylk53QD12//esvXzyLAd/UaIHSMf4tciey7G6/qUbc5xcuhz60lBzfvygNFWclt2o58NM25lMBDHMApONGRWzIiigzgc5eaTW+A/ZGbucs8FW40kU1WV/Yqb+1U2efal9pQhjP2dG772qiiCdypIyJLNm76wUmG4G/fiFdPmoJDBrHEUXLngs73uKK+sxAx0YrPOrmnF9LGI39hLCU7+/tm3GACmFs97s+73sT+UZPqpT/qPBlMUIrX/fUMkdvnNPirAXXolgEVgkIZ/Vh33Vuv1dNQYh1EQJ1v5Cra1/SSghmYHzwXMTz9INVPsTbyN3GmgSoaH4XJ24K7DayoTMb9GF1yG7H9+qoZS+yqIzeJC6FcoQrsSKElpJu9uM1BHYjjnTJA5V7UAnENF9L3I1DTHM1PbBiMac5Od87vIyWbiL2ao1wmdQO0qPI9MDGM3p3hUdqqTpIzsvEwpzr3zRSvLxCV8DyIYxSK0+OMbiZRu+evuEPrS3zocAlliX6MAM13Z7ll9eY3AtrmO7s49SjU3+VHxcg9EIz8nJR1xLvr8Hm6yPbeKfREpflrajWCV4g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 572eee82-1510-4d57-3f0b-08d84d94a652
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 10:00:11.6460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUd5kkMMidH1+YWWW4+pj3MOAbhdis+mEPfSHrgwEXHPtxHowfRsik7Tgaqg+EZK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3968
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
Cc: Gustavo Padovan <gustavo@padovan.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDguMjAgdW0gMDY6MTYgc2NocmllYiBSYW5keSBEdW5sYXA6Cj4gRml4IGtlcm5lbC1k
b2Mgd2FybmluZyBpbiA8bGludXgvZG1hLWJ1Zi5oPjoKPgo+IC4uL2luY2x1ZGUvbGludXgvZG1h
LWJ1Zi5oOjMzMDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnbmFtZV9s
b2NrJyBub3QgZGVzY3JpYmVkIGluICdkbWFfYnVmJwo+Cj4gU2lnbmVkLW9mZi1ieTogUmFuZHkg
RHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQu
c2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IEd1c3Rhdm8gUGFkb3ZhbiA8Z3VzdGF2b0BwYWRvdmFu
Lm9yZz4KPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBpbmNsdWRlL2xpbnV4L2RtYS1idWYuaCB8ICAgIDMg
KystCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiAtLS0gbG54LTU5LXJjMy5vcmlnL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5oCj4gKysrIGxueC01
OS1yYzMvaW5jbHVkZS9saW51eC9kbWEtYnVmLmgKPiBAQCAtMjgzLDYgKzI4Myw3IEBAIHN0cnVj
dCBkbWFfYnVmX29wcyB7Cj4gICAgKiBAZXhwX25hbWU6IG5hbWUgb2YgdGhlIGV4cG9ydGVyOyB1
c2VmdWwgZm9yIGRlYnVnZ2luZy4KPiAgICAqIEBuYW1lOiB1c2Vyc3BhY2UtcHJvdmlkZWQgbmFt
ZTsgdXNlZnVsIGZvciBhY2NvdW50aW5nIGFuZCBkZWJ1Z2dpbmcsCj4gICAgKiAgICAgICAgcHJv
dGVjdGVkIGJ5IEByZXN2Lgo+ICsgKiBAbmFtZV9sb2NrOiBzcGlubG9jayB0byBwcm90ZWN0IG5h
bWUgYWNjZXNzCj4gICAgKiBAb3duZXI6IHBvaW50ZXIgdG8gZXhwb3J0ZXIgbW9kdWxlOyB1c2Vk
IGZvciByZWZjb3VudGluZyB3aGVuIGV4cG9ydGVyIGlzIGEKPiAgICAqICAgICAgICAga2VybmVs
IG1vZHVsZS4KPiAgICAqIEBsaXN0X25vZGU6IG5vZGUgZm9yIGRtYV9idWYgYWNjb3VudGluZyBh
bmQgZGVidWdnaW5nLgo+IEBAIC0zMTEsNyArMzEyLDcgQEAgc3RydWN0IGRtYV9idWYgewo+ICAg
CXZvaWQgKnZtYXBfcHRyOwo+ICAgCWNvbnN0IGNoYXIgKmV4cF9uYW1lOwo+ICAgCWNvbnN0IGNo
YXIgKm5hbWU7Cj4gLQlzcGlubG9ja190IG5hbWVfbG9jazsgLyogc3BpbmxvY2sgdG8gcHJvdGVj
dCBuYW1lIGFjY2VzcyAqLwo+ICsJc3BpbmxvY2tfdCBuYW1lX2xvY2s7Cj4gICAJc3RydWN0IG1v
ZHVsZSAqb3duZXI7Cj4gICAJc3RydWN0IGxpc3RfaGVhZCBsaXN0X25vZGU7Cj4gICAJdm9pZCAq
cHJpdjsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

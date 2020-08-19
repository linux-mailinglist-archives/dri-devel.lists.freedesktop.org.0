Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD272498B2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 10:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046D06E207;
	Wed, 19 Aug 2020 08:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2068.outbound.protection.outlook.com [40.107.212.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BB86E207;
 Wed, 19 Aug 2020 08:53:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1ojHyA0f9UH/lQbu5SFWY1+Y7Nrv0gWKspUVOi33Ib894MHFqWXN1HNLOB3gsxK3NLPFlbZDwbhprIDRVQFzpUQquIz2Jdb6RgqLy7QDbvDOML3KzX1ZFrAVUaZPmb4ULrTsS4zV7P09xIeCXzQJWFVKLRTr7QSQYJClb/ieXrBuCw+uzDycE6QRiqFuZTjZETbiCmbiRh+Cu7QtvPImqw9Yq/RJ4TBqW+Z/twlPSBor4KGYxQMRrhghUPFdfEkXyS8PgfiKjAHU4f3og/3b0DyKcGej6QHpAjbibpDHQWsbEvHTLZ2pNdzNIyQfNdkQBNPaUKKoLqcA+tLiXemWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yWUwJ2QSDzT31n1fgcr/KzMGfevNyFHrTSdWUcr8sY=;
 b=dLnSpxLuoc+IfRIuL+XrM/Bn3Ep/57UXNFf7IkMkjbslwH0vwtiEEvv4A9PK9eCkdoQaEQHTBK38sNo0oHDdG41lqWpJsDJAx9OjVJeIzOYkxbiNnLuaI2DqkLoI8tNT3brehDifqet3NGVLoUP3e5MuP9BIdrqveIvLnHGVXuN3cz8fwXpBJLGoMpodsA3Ch/2Ope35hGPb4SiRJkezAClvQt6OL5PSO0VEniLMSsaV7vxJxx9nKhwvIJw10xGhvknUESGxDSMLMqcY/raHDJThIbsT3OOvrxfVm5P2+qBpmrH6iaiYnxE1kD3NAjnIXzcLk7rSUqLsBLFgIY7RsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yWUwJ2QSDzT31n1fgcr/KzMGfevNyFHrTSdWUcr8sY=;
 b=PXVzsnh8k7uw9g1FA+66jhXXGsGil2HchBke1HbXSimPUsfvgnsc+I/yZ8CWeUdMiRNJE0MI9w4KX7yyRWu0HoJY4+DVXc14Y9DisWjG6bW+59ncw5dG7dUNSGBksPLiyaHAOd4AVXjOufZmVgpaP/m89lWd/ZgZmIXtjmv0yVs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2418.namprd12.prod.outlook.com (2603:10b6:207:4d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Wed, 19 Aug
 2020 08:53:30 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.028; Wed, 19 Aug 2020
 08:53:30 +0000
Subject: Re: [PATCH] drm/amd/display: remove unintended executable mode
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Jerry Zuo <Jerry.Zuo@amd.com>
References: <20200819081808.26796-1-lukas.bulwahn@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f0d3f57c-416c-6a6a-0e9e-d3dc308f2b52@amd.com>
Date: Wed, 19 Aug 2020 10:53:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200819081808.26796-1-lukas.bulwahn@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0902CA0001.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0902CA0001.eurprd09.prod.outlook.com (2603:10a6:200:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Wed, 19 Aug 2020 08:53:27 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 74719b00-290b-426e-aa36-08d8441d57cd
X-MS-TrafficTypeDiagnostic: BL0PR12MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2418C4DFDB948C6A3A18EBB4835D0@BL0PR12MB2418.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: khdSjkSe6nCAUpg+n/Zg8Vg/a5Od56e2Rwf8N2WHjrUY63mQ+uxzU75ECFmZzSSYI7U8yJ16uDxgMBt+yL7KXGHQlQe8oxdjFzYRHxQSYSh4XQsCsm7ektrYE914DvVAMW+fyQwSuJX9QY9Z4FpAujMFdEHBLTgWpVaEFPFTLntaLUSoTsyLV6U+1n/YDvhMvMoW5sXxS+oSHEQxDckMYoRZI4TlRg8sKFPyn9M9HEiEHSzt5ui7o8XE0pzXL+XP/PM/txC7GZVu44c6azoCng0qFQXrx0UwN97JWiuTWl2UwWmAUMT4EA4toAYKaCpVkPJmUThRjBtaYGqGLdjmc9V/nvIfKKScuif57r/zFWyqXixxpYtNhsuPxx9Trbx8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(2906002)(316002)(16526019)(52116002)(186003)(54906003)(8676002)(478600001)(36756003)(83380400001)(6666004)(8936002)(6486002)(86362001)(5660300002)(4326008)(110136005)(6636002)(31696002)(66476007)(66556008)(2616005)(31686004)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 5zBfEyDOE/L1lrsYamXrkS+zcq1ilu3wtt/T0D3ohnmdoJY9x7JGSy5jJom2TQOFEWR4D3tZOb1CjLcAlBrWDIVgltH2L41dJ8UpDtA03KixK5Gue8xZfKXVvkZ+xFIwFEYrYFpq/WTAMZeVWtF+vaN+wfhi5uREK3NgSKRKQrHM6vBSLOyUT7d95/xxP1R+ifTx/UPzSgQeMp67QIcTEARuwWj0eBNL4I2INBw4NcP2pisCZQMMkVcaPv5JdvbKzEHQXllP9iZ4nz4VmLiVp8PV8tsxsdh8kQUcNREw4q6T+RooI2Q0lhWavGdMQwAnElTQ73F//XC4f6WFjaQ6pmPMduFkBJLFFPKq2bn3rNbSK3bUc1Ewo2EezKTGfV2h6L6tS3WSwM8+MYaHIDA+pKR0ahcWO8gUCC2E/NQct9SoGcath6OFlTEF1wqUVD3qQPyEg2VgtUYChGHgsYItM8C/5+rpDQ5uDHp2o6t3P1D2upbTkM/YSYZmnKqHLXYoxzG5BmJiE49oReJTfqo+UAJDwyLyiuR/CDDghPOsfZBg6LJEfmrfMTozECGpNEDJt1P3yMi09zyrYbb4Y2cpLpqmZ4BmN7/dVXlGi1xlmMPBkuu7Hxy7K+/F5YZAdGa6JUn9Ajss3gqUclZftaw8ohhvvylaPcyT08uSowIMDZTDZgkD5FYuoN16c0acF62aUNwgiv8vMfNkJLLfXtFq7A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74719b00-290b-426e-aa36-08d8441d57cd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 08:53:30.5543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOnTY4LDCcpcioFYkZQ/HwtndVGwm5RJmKtve10WmLcBBIYu7ThnekwbKZJXO3c/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2418
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
Cc: Guchun Chen <guchun.chen@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMDguMjAgdW0gMTA6MTggc2NocmllYiBMdWthcyBCdWx3YWhuOgo+IEJlc2lkZXMgdGhl
IGludGVuZGVkIGNoYW5nZSwgY29tbWl0IDRjYzExNzhlMTY2YSAoImRybS9hbWRncHU6IHJlcGxh
Y2UgRFJNCj4gcHJlZml4IHdpdGggUENJIGRldmljZSBpbmZvIGZvciBnZngvbW1odWIiKSBhbHNv
IHNldCB0aGUgc291cmNlIGZpbGVzCj4gbW1odWJfdjFfMC5jIGFuZCBnZnhfdjlfNC5jIHRvIGJl
IGV4ZWN1dGFibGUsIGkuZS4sIGNoYW5nZWQgZnJvbW9sZCBtb2RlCj4gNjQ0IHRvIG5ldyBtb2Rl
IDc1NS4KPgo+IENvbW1pdCAyNDFiMmVjOTMxN2UgKCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBkY24z
MCBIZWFkZXJzICh2MikiKSBhZGRlZCB0aGUKPiBmb3VyIGhlYWRlciBmaWxlcyB7ZHBjcyxkY259
XzNfMF8wX3tvZmZzZXQsc2hfbWFza30uaCBhcyBleGVjdXRhYmxlLCBpLmUuLAo+IG1vZGUgNzU1
Lgo+Cj4gU2V0IHRvIHRoZSB1c3VhbCBtb2RlcyBmb3Igc291cmNlIGFuZCBoZWFkZXJzIGZpbGVz
IGFuZCBjbGVhbiB1cCB0aG9zZQo+IG1pc3Rha2VzLiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPgo+
IFNpZ25lZC1vZmYtYnk6IEx1a2FzIEJ1bHdhaG4gPGx1a2FzLmJ1bHdhaG5AZ21haWwuY29tPgoK
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
Cj4gLS0tCj4gYXBwbGllcyBjbGVhbmx5IG9uIGN1cnJlbnQgbWFzdGVyIGFuZCBuZXh0LTIwMjAw
ODE5Cj4KPiBBbGV4LCBDaHJpc3RpYW4sIHBsZWFzZSBwaWNrIHRoaXMgbWlub3Igbm9uLXVyZ2Vu
dCBjbGVhbnVwIHBhdGNoLgoKQWxleCBpcyB1c3VhbGx5IHRoZSBvbmUgcGlja2luZyB0aG9zZSB1
cC4gSWYgaGUgbWlzc2VzIHNvbWV0aGluZyBmZWVsIApmcmVlIHRvIHBpbmcgdXMgb25jZSBtb3Jl
LgoKVGhhbmtzLApDaHJpc3RpYW4uCgo+Cj4gRGVubmlzLCBKZXJyeSwgcGxlYXNlIGFjay4KPgo+
IERlbm5pcywgSmVycnksIHlvdSBtaWdodCB3YW50IHRvIGNoZWNrIHlvdXIgZGV2ZWxvcG1lbnQg
ZW52aXJvbm1lbnQKPiBpbnRyb2R1Y2luZyB0aG9zZSBleGVjdXRhYmxlIG1vZGVzIG9uIGZpbGVz
Lgo+Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfNC5jICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMAo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFf
MC5jICAgICAgICAgICAgICAgICAgICAgICB8IDAKPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5j
bHVkZS9hc2ljX3JlZy9kY24vZGNuXzNfMF8wX29mZnNldC5oICAgfCAwCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvZGNuL2Rjbl8zXzBfMF9zaF9tYXNrLmggIHwgMAo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL2Rjbi9kcGNzXzNfMF8wX29m
ZnNldC5oICB8IDAKPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9kY24v
ZHBjc18zXzBfMF9zaF9tYXNrLmggfCAwCj4gICA2IGZpbGVzIGNoYW5nZWQsIDAgaW5zZXJ0aW9u
cygrKSwgMCBkZWxldGlvbnMoLSkKPiAgIG1vZGUgY2hhbmdlIDEwMDc1NSA9PiAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzQuYwo+ICAgbW9kZSBjaGFuZ2UgMTAwNzU1
ID0+IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMKPiAgIG1v
ZGUgY2hhbmdlIDEwMDc1NSA9PiAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Fz
aWNfcmVnL2Rjbi9kY25fM18wXzBfb2Zmc2V0LmgKPiAgIG1vZGUgY2hhbmdlIDEwMDc1NSA9PiAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL2Rjbi9kY25fM18wXzBf
c2hfbWFzay5oCj4gICBtb2RlIGNoYW5nZSAxMDA3NTUgPT4gMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9kY24vZHBjc18zXzBfMF9vZmZzZXQuaAo+ICAgbW9kZSBj
aGFuZ2UgMTAwNzU1ID0+IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19y
ZWcvZGNuL2RwY3NfM18wXzBfc2hfbWFzay5oCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OV80LmMKPiBvbGQgbW9kZSAxMDA3NTUKPiBuZXcgbW9kZSAxMDA2NDQKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jCj4gb2xkIG1vZGUgMTAwNzU1Cj4gbmV3IG1vZGUg
MTAwNjQ0Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3Jl
Zy9kY24vZGNuXzNfMF8wX29mZnNldC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Fz
aWNfcmVnL2Rjbi9kY25fM18wXzBfb2Zmc2V0LmgKPiBvbGQgbW9kZSAxMDA3NTUKPiBuZXcgbW9k
ZSAxMDA2NDQKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNf
cmVnL2Rjbi9kY25fM18wXzBfc2hfbWFzay5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRl
L2FzaWNfcmVnL2Rjbi9kY25fM18wXzBfc2hfbWFzay5oCj4gb2xkIG1vZGUgMTAwNzU1Cj4gbmV3
IG1vZGUgMTAwNjQ0Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9h
c2ljX3JlZy9kY24vZHBjc18zXzBfMF9vZmZzZXQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5j
bHVkZS9hc2ljX3JlZy9kY24vZHBjc18zXzBfMF9vZmZzZXQuaAo+IG9sZCBtb2RlIDEwMDc1NQo+
IG5ldyBtb2RlIDEwMDY0NAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1
ZGUvYXNpY19yZWcvZGNuL2RwY3NfM18wXzBfc2hfbWFzay5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9pbmNsdWRlL2FzaWNfcmVnL2Rjbi9kcGNzXzNfMF8wX3NoX21hc2suaAo+IG9sZCBtb2RlIDEw
MDc1NQo+IG5ldyBtb2RlIDEwMDY0NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==

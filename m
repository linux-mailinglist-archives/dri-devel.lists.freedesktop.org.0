Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5CC1B6FA2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 10:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770A96EA9C;
	Fri, 24 Apr 2020 07:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6716EA9C;
 Fri, 24 Apr 2020 07:52:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPgXBhOPEf7CRra7Ww0jjRXGOlMyAgXrAyT10fHjJQCw+Dx838Mz3/IVxX7KHLLenV1SKD3seS/cjP/YvGMpkEB02n2ixr+ASHMwpjU4LHiZwGYNfqcvz8G2TBpYbXCoYApHGd1rQLS3nYjuNI/LiuJOo7CXKP4IEaWYKToGkRM6pgedIZO3ofSNGm0Cf7zbG1F2PsEIlOJhx7A3U1NnrZNpX1AGL8onkHuYe68XVe3wY/38r0a2wXlAqXgp6A0wM4InxGUpSTG/zNrLcSGY9zGS15fmZmrK4RvqruU8f4Tr7z8t2a2tlflFLmgYBrewBydXvxZ8AEpTnNKhfNDn2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvhwPE2f0BsWNDEcQ6l5SvenEtJnzFqKXBz/malOYkA=;
 b=Uwg0WfEGlSwo1wXY1tMaOLPhLM1QRMvULYubk6k6VndZewOfIg8hI+Dfs+z+CO3hBkbhG2YpwxXvEU2y5oRF/LQZH9tKNmALdCCV9DlkCUgMP7nxkx3IRMz+k7H6Psh49usNdw2ZLddFrJolXUuZjZzCtmZi2P7dsAKKVpvJfLua4yO0IKKAp2nmdl2zl6nS3xyA6/+uQmDKElLpI6tvOl1bqEz6JwhMf7KF3vaXL0IWaY+p1XgRlsxxSUrV/kAMHH+HNFp603I9ySfXSaVh+Qhk6iKGOLzcGTdoOAYLCjsXjTah1Ncc9mHM7/8cZxbNhgvFJi7MlFGi5tLsngaQUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvhwPE2f0BsWNDEcQ6l5SvenEtJnzFqKXBz/malOYkA=;
 b=sxbUkk09A/Pc62Erc+mdzJSVYZ96lWOOxnCYlkUsY+2U9NLfaf2bQ6OQnSyORiD4HJkEhEUKLfXo8r1pRhUJ0Q+vuTBzipP96Rn9oB+UuhcSYlpURaXR8Ov7v/2fTAadNBLzi5guLF/NMG6wMomYVaPTsqOJp7grCvlAXS5q5c8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3419.namprd12.prod.outlook.com (2603:10b6:5:3c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Fri, 24 Apr
 2020 07:51:36 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2937.020; Fri, 24 Apr 2020
 07:51:36 +0000
Subject: Re: [PATCH] drm/amdgpu: Remove unneeded semicolon
To: Zheng Bin <zhengbin13@huawei.com>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20200424075620.22364-1-zhengbin13@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2ebe7c66-0562-b61d-bf36-278a52590ce7@amd.com>
Date: Fri, 24 Apr 2020 09:51:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200424075620.22364-1-zhengbin13@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0020.eurprd04.prod.outlook.com
 (2603:10a6:208:122::33) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:208:122::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Fri, 24 Apr 2020 07:51:34 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 00f37cd2-688c-40a6-25b4-08d7e8245047
X-MS-TrafficTypeDiagnostic: DM6PR12MB3419:|DM6PR12MB3419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3419541A626E10CDB79A060B83D00@DM6PR12MB3419.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 03838E948C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(5660300002)(81156014)(316002)(6666004)(8936002)(8676002)(66946007)(31696002)(31686004)(16526019)(66556008)(86362001)(66476007)(2906002)(4744005)(66574012)(36756003)(6486002)(52116002)(186003)(2616005)(478600001);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LjkfqPb60PjPVNQY0vsfbw4Os1RWEOAVEJsANsnqYZCeClHZGewax0qxrrsNaIUIwLI0US/Cu3Gu0HBhJIAOimUJxhZV7zqlBmsFodgM68VHQCFXgROtsI7RAZKhAPiGeuzvSVcxrqU1M4monRkdaX5K8J9vavcTQdU+QULrh8LvXctIwPou1t1QpvNzmY+SdV99lfd/oCfIwaF8nJjMbOsbAxLXYY+SIuPagMTwCqlhAqN4kgmxkxSrFK2qZfJKzSw6RN3oXJ4BaZ9RmAXskJdieliA9JOTeVoVTRvC/FYcZvdsG7CbX/CJid66j0BXV1+zZBML96WS4u6CWuttxqaRinwYRga/dSv5rSoaTlpLsgUtpR5N4lNQc4j9YCwG1V2YIxoy6gEtcoLqmawWCnZuxEv9hbxsn/miTDVBW+Sceoa+W2rZvDv4N1OgC5MP
X-MS-Exchange-AntiSpam-MessageData: ImJd6QSl99yKRFGY31etV8LvcREKE3sM3bv5aDTgwQtaEsPwy3SlovpZJ/lMh0oxnNHNm6HgBWAIWDrRuX24vPzjAlntNmT6NPrp5wRf7VDKlhCDYRJHlfNMXtT+tIPqFRvLOkZBoWjIhWNNQ1SCwIJ2IYDs1ZJJ2tLK/R1jqtIQFEqT9x17FGRbjxruln3QQejd7w3gRJqX1a/zR9nNOIurQDJ+qCntsbqsHErmfRDIskyxnDCuULz1uXV3HYXvcCglulEZf3JL/7FWh16sqyvF2F+DHA8LAN8p49xOzE93RGS9GSuD2FAuVKwNZOu058DASo/0HKiX7c19p9KXbDyWuxTVuGbNSPVwBGzgpYjT+nAjk7PvRfbZ9dYiJsGwGUhaAQjWxXMZ5jAUd+HLTqfKRvCXqsGjRLlo8UjTKVz993daJ8NzUIoPO52ql9QZZOaE9EobMPPVbt1EbiPZOPBAVPZdAcZLKar3L7LYn0DY8qZxWZPE2glJ+2bbQhwjZ4oAf/gSB20GUEhgYrUARpH1NU8asO+rF48Ws6NdF9Im8O/1NwOShCax4ovWcQoQD7HvY/5VLASqjj4Ji5OAh2K1SDTEKDBM2K886y2iUFJF9/OAxz9ZJzseU9PR3xULnNV+MmZbe1lowzUIcg6KRCQPfD60qvoJYIpY/IT9B6Q4kjfPR3xbPcsqOhI3pEtalrsqmaqQNBQB9ku02JdZUQ6B/ll/hgOaq3so4H64VeLz5wenkSHG3Eumk4O5S96IKJBUmml4zYjxoSodUMdHsXzxd27XyP67JvDTPGAyPfLkF02qppmXPKkHJvN/gB2s2D+PwEYUc53CmOTzJAZtd6fLcqLf08XShIE9L2lxaZE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f37cd2-688c-40a6-25b4-08d7e8245047
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2020 07:51:36.1004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnS4hCsM9XGZVOnUhRFkYrL31nLFb5jKLsTHkxk/kUxxq6VmoFOI/bYHdXjOGybY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3419
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDQuMjAgdW0gMDk6NTYgc2NocmllYiBaaGVuZyBCaW46Cj4gRml4ZXMgY29jY2ljaGVj
ayB3YXJuaW5nOgo+Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYzoyNTM0
OjItMzogVW5uZWVkZWQgc2VtaWNvbG9uCj4KPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVs
a2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWmhlbmcgQmluIDx6aGVuZ2JpbjEzQGh1
YXdlaS5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8w
LmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwo+IGluZGV4IDA5YWE1ZjUw
OWJkMi4uNDNkODQyMTQ5OTVjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92OV8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jCj4gQEAgLTI1MzEsNyArMjUzMSw3IEBAIHN0YXRpYyB2b2lkIGdmeF92OV8wX2luaXRfc3Ff
Y29uZmlnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgCQlicmVhazsKPiAgIAlkZWZh
dWx0Ogo+ICAgCQlicmVhazsKPiAtCX07Cj4gKwl9Cj4gICB9Cj4KPiAgIHN0YXRpYyB2b2lkIGdm
eF92OV8wX2NvbnN0YW50c19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+IC0tCj4g
Mi4yNi4wLjEwNi5nOWZhZGVkZAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK

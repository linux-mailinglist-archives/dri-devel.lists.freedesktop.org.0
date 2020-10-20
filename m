Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7BC293913
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 12:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7BF6F42C;
	Tue, 20 Oct 2020 10:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651AC6EC45
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 10:22:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fC2phTY2vI9rxmtZzfcKWAYCzlZrmrK4DAJGwVazynYqkiALOhcvYnNxboK47mAMEb0hIrsPjxsBnOt4L9XgD9faGy7OK1A+mJOtPI/G+Q5QhClcr8ApetD0EryuGeVEnQCKa0Ex1+LKJOFdDiFosZ9PPpSbp2Jt/jhCeN/i4eWhXjU9J7g1natY/WNXj4/vIapmpHJfjqjaKm41Dvv8DZ8j7jIlJwubNsLvx9pWQaASOD2T4wAYWoNktFADgJoIcy4y51YO+xSgtg+KdDGA8KK5N9tKaXVuKsBiUNa1GEpaAiNQkJbiX+5BpooSJ7rGz2fF3LmYhxzZWKY3QPfEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85EZlsUir4JFWbid+H/M0+DpQVfX5/SrsXYB0+EcSt0=;
 b=N089L+4CtbXYnudj8pc9MsrocQ+5f+UTuAN7KT1+F2TcSYTtGSJx4D6gZ8UMMOMI16CAMbQafcaidz2HOQSbhh0NTYEE92244DEjGEzBDgRqAwTmDuse5BLj13aRPlkqQ3xwnHt/s426tgVY45Ybcv9b9jAlUqhz2nJ2jTj2YBVIAAF3pAVQ5/9HApNCdGjio9yr1qklwqIUblwQyzOVtdsS8X2Px1yUg+0G1nXPRZ3k2kMZUzTpC9mtuhi/aBTzUv53F1xCKBGTV+qahR8d6gAOhkTIFgnMsaM9OKRDI/UW49svCQvfKH/fBnyXRvV7W1ls1pRDLw4Dq+xkgT5Uug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85EZlsUir4JFWbid+H/M0+DpQVfX5/SrsXYB0+EcSt0=;
 b=2u8mI+JC2XcWnKXfytFf9ubDqPZrxWF3QERTQfrAfffgYLYi/b7d+gYsHB7UxDxj8pC0lq4NQeuzmLF3QqWpP1ogqkZXUAGJHkev2QKOyhcIjrfwo92HdlQJu7BP12SFi+fuYYsV47gc7Yzv6WcwMs5k/kmw8N7GmR87wQAC110=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Tue, 20 Oct
 2020 10:22:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 10:22:43 +0000
Subject: Re: [PATCH 2/7] drm/ttm: minor cleanup to move to system
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201020010319.1692445-1-airlied@gmail.com>
 <20201020010319.1692445-3-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <65c7e749-e6cd-98bf-fe27-a4c80d5ecf7a@amd.com>
Date: Tue, 20 Oct 2020 12:22:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201020010319.1692445-3-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0118.eurprd04.prod.outlook.com
 (2603:10a6:208:55::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0118.eurprd04.prod.outlook.com (2603:10a6:208:55::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Tue, 20 Oct 2020 10:22:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b18ca84c-3655-4424-8699-08d874e214a8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4111:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41117BBD50D6264633FCB7C7831F0@MN2PR12MB4111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZPjFo531VH0bZaPUDcF0hgT3oBCQLAV7cigCC64ZAe9uvik29PF4xlzcf7UKZX+eSkBWesD39S6TUB7ofMW+OADgl94UYBR+xfSBBd3alTLy+C4FKvUkKsqKuxiteqtqpRWI0h6ECLFKPhLsfMZMzsNv1mq7XxRYDQL9ct8l9PG+Ev3Ow+vFOT35YYtB1wc0bWbW6VkVwbEPDq9NsGXdP5+QbQRT0HTyaRvMx5BQ/3Q5cnQ2owzs+ryLaIEHQgRHoI4ZhdmRIDeRF1i4X0c3oFkxrIfzYqi+KOAr8dE8z1X9T1AJhQxqxTg5NTd+uEYGIaCX9bkTDjl/gO5Y9yAWI5dVAHgfp2L/QPitwbpoUjqA1OfWkIRC+60Z2M6fARKk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(186003)(36756003)(16526019)(2906002)(86362001)(31686004)(66556008)(2616005)(478600001)(6486002)(83380400001)(316002)(66946007)(8936002)(52116002)(6666004)(5660300002)(8676002)(66476007)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +8o7QgYF7diI9vlAHN39EzDCM4egRpkSVVieRyUOZGxKbUUM8RIQvXElzcWxyixeUeRuSWy/heO+3pHuCHSx5pygf8ZiUGHvrOEvDMNr0ONuordD/3esXKOIsnU1aDyEibr3/oxTCnmYZEdEZXToJ9w3VQQYN5fX/1/mFR8GN+aA8CVsrzpy5ZdCXLoyLJULDetKVC1irFFCU3mE5x309PmtRGfF6PE+FIDWF+XT3kIRJ2NTFHBcVAYcXNz3C4dsuXWDSOPo9nw1m7oOXuXScWKCG58LfD/xsQmlN6Yae2Zq1s1HAiALZSLsFJTnGrjMStdYGNsfH+xaHnk/4pXCiessshv5xYVVnaLRwD9pTQ5bjnCbjTHwBWhkrKeTnxvuM6uyCH3cJTTgF7Ogwtz2Ekwh5T+OiUpQq6ReYwuGiFFoTFHlgOClnUkYzXZ+L3NuqqJF99l0mDBlt4oHemghx2L6VxQAjrH4NEaN4Gt4duGCmaa6e3UQT41qSqzn3JbmleAFiyyT60AgFbR6VRiwSSA81Kw7Zeu99FzsP+or96Z2P19vsudT9ErDZS+S1lU6PLbI7MbtRQnjEJVRHKqwISR74yl4A6yqFlOywk/3zITXdSUOGaiADggV7zs7a7n26a1mD3Etcx2cU4s3GqkyOfVYnQN377+a3cJs85p9PRSmQNZFDymxusfCAk0UgRg4RtCdYYT0VRZd9huuPxSk6w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18ca84c-3655-4424-8699-08d874e214a8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 10:22:43.3413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ryubmfcS6ABXAvYWnQbMP+p37PSGhX7ZMmxjng2Ppa5mElFAo3N6GrXwLzjmnhU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
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

QW0gMjAuMTAuMjAgdW0gMDM6MDMgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gcmVzb3VyY2UgZnJlZSBhbHJlYWR5IHNldHMg
dGhlIGRvbWFpbiB0byBzeXN0ZW0sIGFuZCBvbGRfbWVtCj4gaXNuJ3QgcmVhbGx5IG5lZWRlZC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CgpSZXZp
ZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAt
LS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyB8IDQgKy0tLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyBiL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvX3V0aWwuYwo+IGluZGV4IGM4Y2E2Njk0Y2MxYy4uYjczMGU2MjRhMjIwIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+IEBAIC02OCwxMCArNjgsOSBAQCBpbnQgdHRt
X2JvX21vdmVfdG9fbmV3X3R0X21lbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAg
aW50IHR0bV9ib19tb3ZlX3RvX3N5c3RlbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+
ICAgCQkJICBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCkKPiAgIHsKPiAtCXN0cnVjdCB0
dG1fcmVzb3VyY2UgKm9sZF9tZW0gPSAmYm8tPm1lbTsKPiAgIAlpbnQgcmV0Owo+ICAgCj4gLQlp
ZiAob2xkX21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSkKPiArCWlmIChiby0+bWVtLm1l
bV90eXBlID09IFRUTV9QTF9TWVNURU0pCj4gICAJCXJldHVybiAwOwo+ICAgCj4gICAJcmV0ID0g
dHRtX2JvX3dhaXRfY3R4KGJvLCBjdHgpOwo+IEBAIC04Myw3ICs4Miw2IEBAIGludCB0dG1fYm9f
bW92ZV90b19zeXN0ZW0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAo+ICAgCXR0
bV9ib190dF91bmJpbmQoYm8pOwo+ICAgCXR0bV9yZXNvdXJjZV9mcmVlKGJvLCAmYm8tPm1lbSk7
Cj4gLQlvbGRfbWVtLT5tZW1fdHlwZSA9IFRUTV9QTF9TWVNURU07Cj4gICAJcmV0dXJuIDA7Cj4g
ICB9Cj4gICBFWFBPUlRfU1lNQk9MKHR0bV9ib19tb3ZlX3RvX3N5c3RlbSk7CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

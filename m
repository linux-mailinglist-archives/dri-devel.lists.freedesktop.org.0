Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D11660E708
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 20:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1073710E6BC;
	Wed, 26 Oct 2022 18:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE9610E6BF;
 Wed, 26 Oct 2022 18:13:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNCYyXxClUaN9v35THx3NjD/hRjVKogZa5TlwI+2Tg0anCiDAERAmUk2v9ZrFMbFl2/xdOFQPRrDtZ9iy+Hm5kmCCmP6oZ98BhtY1uQ4FxSJrWh5Oai3X1fkZiQRxbrFaL+RRJYbt3+92ZOe4s6IIHpwqtvy6V3/kj4S8EaWS9ZpyqtIlzwDY8uwdwJDPvfZzBbqJs8D0fBo6gkNNCMc9hWHq4Prex9KyF58hbxXUTgmytITTEhAu7DzPMl5H0Lgy4rL5tH7FRnS/bttj/2bBLt9lYCKUDaX96NJCkfj9/Px8gtgzpSmZiXdgSLvDYnzMjswfaezDwAvjg5ct0fxgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3p74eRIdOnzX6DBeLcbL0vs01pazXrecOvtczUcmE3Y=;
 b=EuX4hIfWDpwQJu4IYncyzgjSZg1pDfVOGmAOYeBJ0jOMyGSelK+142ddF+PaUJISLQUYEuFp8E5gVCTFmgiTCrBEdTqsWxbwdOpAwhwET8qAEsxpm2au1/DCVIFtaf9vIOuWd8qVSgr//qB8YrILKxJ+2jvCORt34yzhP8A1/CrmVKE2ipFdW9azcz1+9OP5efffhiZhW2FmDi/3lvdqUz2IzhHdtaGusosdl+ceFHuHIo9AoP9j2v8TKXiQ20nt4EEEymHPWD4sfbWiPzROSNl1UGed98u9UxR93fU/+BMeii1CkqxekbNoQUwUDy1tp26fYgRDFfiWx/GlhJ4EBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3p74eRIdOnzX6DBeLcbL0vs01pazXrecOvtczUcmE3Y=;
 b=Dd1dY752RACETPXuzMjOdMTiB9401iCldSys1cFZNrFA3qmhsZv5vuU6xv7nj7qgwwVGvekHwVELPy6u9+nO0BHxuhAUHmAdfG0kE4W2mfgNu7+Us8tWMbYSxvZUndHYY0Dd1Ai8av73i/KtI17L5WcyaywMBVbOzWCnjk56E0w=
Received: from CH0PR12MB5372.namprd12.prod.outlook.com (2603:10b6:610:d7::10)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 18:13:16 +0000
Received: from CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::87ec:c064:1f39:c8ea]) by CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::87ec:c064:1f39:c8ea%9]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 18:13:16 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Tuikov, Luben"
 <Luben.Tuikov@amd.com>, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "daniel.vetter@ffwll.ch"
 <daniel.vetter@ffwll.ch>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/5] drm/amdgpu: stop resubmitting jobs for bare metal
 reset
Thread-Topic: [PATCH 2/5] drm/amdgpu: stop resubmitting jobs for bare metal
 reset
Thread-Index: AQHY6VDHJzaRt1XClUmFt0meJkeTAa4g1MiwgAAY34CAAAjyoA==
Date: Wed, 26 Oct 2022 18:13:16 +0000
Message-ID: <CH0PR12MB537262629F9DBC0797ACF1D1F4309@CH0PR12MB5372.namprd12.prod.outlook.com>
References: <20221026153557.63541-1-christian.koenig@amd.com>
 <20221026153557.63541-2-christian.koenig@amd.com>
 <CH0PR12MB5372F1A8B89543E067865EC6F4309@CH0PR12MB5372.namprd12.prod.outlook.com>
 <87386405-8dd2-f88b-1755-620962786925@amd.com>
In-Reply-To: <87386405-8dd2-f88b-1755-620962786925@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=98a25f1f-a4dd-4542-ab42-8cd741d908c4;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-10-26T17:58:55Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5372:EE_|MN2PR12MB4408:EE_
x-ms-office365-filtering-correlation-id: 54f5ba81-f91c-4755-fe6f-08dab77dc10a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QPWudJZITk4cF+YGG8m5RAjb3t1+GQBoHvP6gUVuvWO94V4uBdlaz2gbm8uIpMZFZQCBFxlJctPlRapMswU+24FaOBujUKK8wRBg90mPsI30xERyVgv9jmR9jJzz7LCEa3L6DQYmUi7hDzo2HxwS9heZOhhJH93dJ5zBDCDdhUD6pq3PkM8JvDPpg+v6Hhn8T+f2HMQVXoOQRavq13tq4UNi5je5RSFjoJbNCd3DoZtpZNwkXK1696IueVNS5GD0/l8VktC5DBeZifKOv2x0AezkAglrmoUIMv6Ht/mrKkyQxqlqcnvoBgjfFKfjDx6zVrHmj6UlBkTAE7XgRWn2FNTUKULWUnUlgiPEFpubXpqFzz88HHX0M7maFDhJWlifFbJyza/T4wiuGBwxEyrKOamoydYPZzNPAd+wL01TZ3u2P1YN8x62xFa+yYYbmHDqPEL/dUgmJtamRalGFpx65ssqt/LdnsY2D4JjnHEyo0RrjrIR9RUfppgbYNcFbZ4Oqw/s83Hvzd79Oerh25WdJ00TzcpA7/EhEdIxhK93arm1FcnWtZTzclMrv9VzY/KzHg75KTC7GLxiRB+i/GBnTtY91lLvoH68qbWXqPKOCesLC79hfpOO8cVM6SXxn9z3RxX0F/PUqoqyhUylNAxeRjO0fjU310O/f6tZwZmn7VtFwptauL5p6RcHaAjqwz7zCdYjIhnvBtbfEWIMLjkjPlNuNTJVJ/Fcz9KvHvalezrglbaV+fyPWFb3/PyDAV9NVfKx2NDVHiX/rtIOH7+iAzwqJQHyL5EBFmQTg9OUA+c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5372.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199015)(6506007)(316002)(26005)(76116006)(53546011)(8936002)(9686003)(66476007)(86362001)(33656002)(110136005)(38070700005)(66446008)(52536014)(66946007)(66556008)(5660300002)(41300700001)(8676002)(64756008)(2906002)(122000001)(921005)(478600001)(83380400001)(66574015)(7696005)(55016003)(38100700002)(71200400001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEFwOVRVelI2NE90K1BENzVZNDR0V3hTbUpYRlZiZVdSK1dlUUd1SlMyRlhC?=
 =?utf-8?B?NytaY09Dc3k4NFRXOENTSm16N3ZsVEFaOW84UjhhamtLS1F2bWtQKzFMUEJ3?=
 =?utf-8?B?TExOYU5vUVB1YzMrVWt0THExMFVRL29ROWcwZGZneVRHT1JqWHV5dDR6MkFL?=
 =?utf-8?B?QlNEeXV3TURrOXpBYkNSUURESENRcHlxNFZxdUM0TGxja3BaR1ArcHZhZ0Fm?=
 =?utf-8?B?SWU2VGcrcTFrcjd1WlRtT0l3djM0c0dUMFJCSlB6K253TzhhUXRvalEwSHJ1?=
 =?utf-8?B?SGpkM0lseHVxUFVwM3ZXdFRGOWdEMUFzNzFuL0ZnSWpjdm5wM2JuTWlRMm5B?=
 =?utf-8?B?R2NyQ0hTNkxaT1JkUlppRVNoTStKSXV3T2h3VnU3MlZ6Nk1QRjR0cS9TVWJo?=
 =?utf-8?B?UG1BalR4NytEVy9qSXpBa2cyTC9ubVJhNlErazdoTGxaVGQzS2hOdXFINm5O?=
 =?utf-8?B?d0djanB6ZDl0Y0docy90dElFdDN4NkxMT2tBV1g2cEwya21iVEltZlZudkcr?=
 =?utf-8?B?K3pPbzRJVHpBbUFkY0t2MVpCWGVUZDB4TjlNK21hTmJjcit1cFcyanRac0kr?=
 =?utf-8?B?Tk9zV21DNFBqOVhTYlBrVmRuOXF3VGVwTnJaRlVaUFpnRWw1RTRyRCtZYmFt?=
 =?utf-8?B?NVRVTUNteXROeW9HczVIK1NHeUtmSjQ2U0ZYV0xnL3JJdVpoK0tHRGc3SlNV?=
 =?utf-8?B?VXJ5N3lMZFZxeGJIV3FBZFFnSjg2b1UrOWpuNDBBU1MrVUhIOGlkRnNyaXF1?=
 =?utf-8?B?bldMMEFRMUJzVDJ4eXI1Z2E4Rno3OU5mc3RuNWMyWXkzYU1MS0hvN2JZRCtE?=
 =?utf-8?B?c0Fsdmt4WUpEOG83aDVmeE1BSkc5bktLMkl1RktLc3VibEYwcWdWMmtmRG5N?=
 =?utf-8?B?dFp5MTJlQzcvdXBJZUFaWWdRSVgwUkh4bXlVRGJkOVNmaE1na2NaNlhIdzFC?=
 =?utf-8?B?c3hubDVYYnZOZXFxeWJic2VuVDhGZ2JiOURsVzNQS1JybDQ3YkJ6bGNDZVM3?=
 =?utf-8?B?WHpHNCt1M3kwdjZJSXJXOHBoUEZPb2NSK0FRSUNXM3FZMUVmQWdEdStGMXo1?=
 =?utf-8?B?VVF3bk5pSVBxbTFXYmp4cW1QcWZQNWdXbkcwcC9Ea05iT2hvd0oyUFhtNVU5?=
 =?utf-8?B?L1J3cXFxODIyTDNMMVNHRVlCb0NNMk42cUJMWXh5cWVBRFpKcXFDT2tqaW5s?=
 =?utf-8?B?emwxMTVIeldwK1dvRW5sb28vK0hMMHhPcDVwTUlnVjR1cXRKZkxYbWpQdkRQ?=
 =?utf-8?B?YmlwVE5raG9MR0xMcUw1MFliUXhyUkZPRlUwT3BPMGNFclpvdTRKTnhBRjJN?=
 =?utf-8?B?TXF0aElKZi9nZll2VlViMnNEVXdpbGRkeDhzcnMybmVnQTlyY0I1MytRQUVH?=
 =?utf-8?B?T1VhaGZjNnpEZS9hWXdid1daTGFUVy9vWlhFZEFrUWRJeDhIY3U1OHh1RmVP?=
 =?utf-8?B?N3pOa2Fid0JJWG5wMDMwMnlBMGQ0SmZ6RDlUVFBXSkZCTHZteXpaRkx6NHln?=
 =?utf-8?B?T0ZkcnpuRkEvK0U2S0F3c2JzOHJ2WDhhaktuZnZvSVVNQWdJeUlNOUVpQkV4?=
 =?utf-8?B?b0hhdzdqb2tRajR4TytFeVBvMHZCUFRINnpNWGV3S1VCTkxwTm5uUUZvSW0r?=
 =?utf-8?B?T2VUQ2t5bmVRdWJ3MUVZdUQxOGhNWG1pM3lSWjNNV3E5MllMU2NHRm92eUl3?=
 =?utf-8?B?OVoramRacFVTOTBsWjdUN0tRNFRNUlZkOEl2dk42L2g5aUZoODlzbnNHLysv?=
 =?utf-8?B?TWxKMnR3OGRCV1oxWVRHV2JLdjRxWnFLcEcyLy9aRWZhV094VU5IUGUrbnhQ?=
 =?utf-8?B?Vk81eHVPYzNqM3BMNHZOV2NTL1Rac1FEdWVkZXBJa3R4MGtlWDBkOTRLd2FN?=
 =?utf-8?B?MWRJNkdvT0F3QmhuRWRadXdmMTFwSTYrZFVSellsZzBpS2J3emFZR1AwMy9a?=
 =?utf-8?B?bUZETXkvQ1R1ME1HOXpPR0RleEpRdGxqQXBwWXBJT3ZLZkEwcEZDVDhTUjlD?=
 =?utf-8?B?T3g2UjJzRVlncnZUVTNOY2hpQ0hxcTh5bFhlQUUzVTJnVTlNWGJnT3ZJTWhh?=
 =?utf-8?B?NVR4UFdMQkFGcHhNb0c0MkVxYk9KRC8xNUJvVFJjN0UwNEs1T0pvcWQ0NkZp?=
 =?utf-8?Q?/MvQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5372.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f5ba81-f91c-4755-fe6f-08dab77dc10a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2022 18:13:16.3396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bbRqa2gxUs/39/4ZzeNS/WU8LoBF+hFCsuJaE7x5Rt3HxbRGg8ndEJtDhhuV5FKXZURh3G13u24TC1GIpr5ZsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNClRoZSBTUklPViBhbHJlYWR5IGhh
cyBpdHMgb3duIHJlc2V0IHJvdXRpbmUgYW1kZ3B1X2RldmljZV9yZXNldF9zcmlvdiwgIHdlIHRy
eSB0byBwdXQgdGhlIHNyaW92IHNwZWNpZmljIHNlcXVlbmNlICBpbnNpZGUgdGhpcyBmdW5jdGlv
bi4gRm9yIHRoZSByZXN0IHBhcnQocmUtc3VibWl0dGluZyBldGMgKSB3ZSBzaG91bGQgdHJ5IHRv
IGhhdmUgdGhlIHNhbWUgIGJlaGF2aW9yIGFzIGJhcmUtbWV0YWwuDQpDYW4gIHdlIGp1c3QgZG9u
J3QgZG8gdGhlIHJlLXN1Ym1pc3Npb24gZm9yIGFsbCBraW5kIG9mIHJlc2V0IHNpbmNlIGtlcm5l
bCBhbHJlYWR5IHNpZ25hbCB0aGUgcmVzZXQgZXZlbnQgIHRvIHVzZXIgbGV2ZWwgKGF0IGxlYXN0
IGZvciBjb21wdXRlIHN0YWNrKSA/DQoNClJlZ2FyZA0KU3NoYW95dW4ubGl1DQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktv
ZW5pZ0BhbWQuY29tPg0KU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDI2LCAyMDIyIDE6MjcgUE0N
ClRvOiBMaXUsIFNoYW95dW4gPFNoYW95dW4uTGl1QGFtZC5jb20+OyBUdWlrb3YsIEx1YmVuIDxM
dWJlbi5UdWlrb3ZAYW1kLmNvbT47IFByb3N5YWssIFZpdGFseSA8Vml0YWx5LlByb3N5YWtAYW1k
LmNvbT47IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIDIvNV0gZHJt
L2FtZGdwdTogc3RvcCByZXN1Ym1pdHRpbmcgam9icyBmb3IgYmFyZSBtZXRhbCByZXNldA0KDQpU
aGUgcHJvYmxlbSBpcyB0aGF0IHRoaXMgcmUtc3VibWl0dGluZyBpcyBjdXJyZW50bHkgYW4gaW50
ZWdyYWwgcGFydCBvZiBob3cgU1JJT1Ygd29ya3MuDQoNClRoZSBob3N0IGNhbiBzZW5kIGEgZnVu
Y3Rpb24gbGV2ZWwgcmVzZXQgcmVxdWVzdCB0byB0aGUgY2xpZW50cyB3aGVuIGl0IHNlZXMgdGhh
dCBzb21lIHNjaGVkdWxlIHN3aXRjaGluZyBkaWRuJ3Qgd29ya2VkIGFzIGV4cGVjdGVkIGFuZCBp
biB0aGlzIGNhc2UgKGFuZCBvbmx5IHRoaXMgY2FzZSkgdGhlIGhhcmR3YXJlIGhhcyBhY3R1YWxs
eSBuZXZlciBzdGFydGVkIHRvIGV2ZW4gd29yayBvbiB0aGUgSUJzLiBTbyB0aGUgcmUtc3VibWlz
c2lvbiBpcyBhY3R1YWxseSBzYXZlIGZyb20gdGhpcyBzaWRlLg0KDQpCdXQgaW4gZ2VuZXJhbCB5
b3UgYXJlIHJpZ2h0LCB0aGUgc3cgc2lkZSBpcyBqdXN0IGNvbXBsZXRlbHkgYnJva2VuIGJlY2F1
c2Ugd2UgY2FtZSB1cCB3aXRoIGEgYnVuY2ggb2YgcmF0aGVyIHN0cmljdCBydWxlcyBmb3IgdGhl
IGRtYV9mZW5jZSBpbXBsZW1lbnRhdGlvbiAoYW5kIHRob3NlIHJ1bGVzIGFyZSBwZXJmZWN0bHkg
dmFsaWQgYW5kIG5lY2Vzc2FyeSkuDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCkFtIDI2LjEw
LjIyIHVtIDE4OjEwIHNjaHJpZWIgTGl1LCBTaGFveXVuOg0KPiBbQU1EIE9mZmljaWFsIFVzZSBP
bmx5IC0gR2VuZXJhbF0NCj4NCj4gVGhlICB1c2VyIHNwYWNlICBzaG91bGRuJ3QgY2FyZSBhYm91
dCAgU1JJT1Ygb3Igbm90ICwgIEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0byBrZWVwIHRoZSByZS1z
dWJtaXNzaW9uIGZvciBTUklPViBhcyB3ZWxsLiAgVGhlIHJlc2V0IGZyb20gU1JJT1YgY291bGQg
dHJpZ2dlciB0aGUgIGhvc3QgZG8gYSB3aG9sZSBHUFUgcmVzZXQgd2hpY2ggd2lsbCBoYXZlIHRo
ZSBzYW1lIGlzc3VlIGFzIGJhcmUgbWV0YWwuDQo+DQo+IFJlZ2FyZHMNCj4gU2hhb3l1bi5saXUN
Cj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IENocmlzdGlh
biBLw7ZuaWcNCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDI2LCAyMDIyIDExOjM2IEFNDQo+
IFRvOiBUdWlrb3YsIEx1YmVuIDxMdWJlbi5UdWlrb3ZAYW1kLmNvbT47IFByb3N5YWssIFZpdGFs
eQ0KPiA8Vml0YWx5LlByb3N5YWtAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlcg0KPiA8QWxl
eGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g7DQo+IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IENjOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0ggMi81XSBkcm0vYW1kZ3B1OiBzdG9wIHJlc3VibWl0dGluZyBqb2JzIGZv
ciBiYXJlIG1ldGFsDQo+IHJlc2V0DQo+DQo+IFJlLXN1Ym1pdHRpbmcgSUJzIGJ5IHRoZSBrZXJu
ZWwgaGFzIG1hbnkgcHJvYmxlbXMgYmVjYXVzZSBwcmUtIHJlcXVpc2l0ZSBzdGF0ZSBpcyBub3Qg
YXV0b21hdGljYWxseSByZS1jcmVhdGVkIGFzIHdlbGwuIEluIG90aGVyIHdvcmRzIG5laXRoZXIg
YmluYXJ5IHNlbWFwaG9yZXMgbm9yIHRoaW5ncyBsaWtlIHJpbmcgYnVmZmVyIHBvaW50ZXJzIGFy
ZSBpbiB0aGUgc3RhdGUgdGhleSBzaG91bGQgYmUgd2hlbiB0aGUgaGFyZHdhcmUgc3RhcnRzIHRv
IHdvcmsgb24gdGhlIElCcyBhZ2Fpbi4NCj4NCj4gQWRkaXRpb25hbCB0byB0aGF0IGV2ZW4gYWZ0
ZXIgbW9yZSB0aGFuIDUgeWVhcnMgb2YgZGV2ZWxvcGluZyB0aGlzIGZlYXR1cmUgaXQgaXMgc3Rp
bGwgbm90IHN0YWJsZSBhbmQgd2UgaGF2ZSBtYXNzaXZlbHkgcHJvYmxlbXMgZ2V0dGluZyB0aGUg
cmVmZXJlbmNlIGNvdW50cyByaWdodC4NCj4NCj4gQXMgZGlzY3Vzc2VkIHdpdGggdXNlciBzcGFj
ZSBkZXZlbG9wZXJzIHRoaXMgYmVoYXZpb3IgaXMgbm90IGhlbHBmdWwgaW4gdGhlIGZpcnN0IHBs
YWNlLiBGb3IgZ3JhcGhpY3MgYW5kIG11bHRpbWVkaWEgd29ya2xvYWRzIGl0IG1ha2VzIG11Y2gg
bW9yZSBzZW5zZSB0byBlaXRoZXIgY29tcGxldGVseSByZS1jcmVhdGUgdGhlIGNvbnRleHQgb3Ig
YXQgbGVhc3QgcmUtc3VibWl0dGluZyB0aGUgSUJzIGZyb20gdXNlcnNwYWNlLg0KPg0KPiBGb3Ig
Y29tcHV0ZSB1c2UgY2FzZXMgcmUtc3VibWl0dGluZyBpcyBhbHNvIG5vdCB2ZXJ5IGhlbHBmdWwg
c2luY2UgdXNlcnNwYWNlIG11c3QgcmVseSBvbiB0aGUgYWNjdXJhY3kgb2YgdGhlIHJlc3VsdC4N
Cj4NCj4gQmVjYXVzZSBvZiB0aGlzIHdlIHN0b3AgdGhpcyBwcmFjdGljZSBhbmQgaW5zdGVhZCBq
dXN0IHByb3Blcmx5IG5vdGUgdGhhdCB0aGUgZmVuY2Ugc3VibWlzc2lvbiB3YXMgY2FuY2VsZWQu
IFRoZSBvbmx5IHVzZSBjYXNlIHdlIGtlZXAgdGhlIHJlLXN1Ym1pc3Npb24gZm9yIG5vdyBpcyBT
UklPViBhbmQgZnVuY3Rpb24gbGV2ZWwgcmVzZXRzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDMgKystDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IGluZGV4IGQ0NTg0ZTU3N2I1
MS4uMzllOTRmZWJhMWFjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jDQo+IEBAIC01Mjg4LDcgKzUyODgsOCBAQCBpbnQgYW1kZ3B1X2RldmljZV9n
cHVfcmVjb3ZlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+DQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAvKiBObyBwb2ludCB0byByZXN1Ym1pdCBqb2JzIGlmIHdlIGRpZG4ndCBIVyByZXNldCovDQo+
IC0gICAgICAgICAgICAgICAgICAgICAgIGlmICghdG1wX2FkZXYtPmFzaWNfcmVzZXRfcmVzICYm
ICFqb2Jfc2lnbmFsZWQpDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICghdG1wX2FkZXYt
PmFzaWNfcmVzZXRfcmVzICYmICFqb2Jfc2lnbmFsZWQgJiYNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGFtZGdwdV9zcmlvdl92Zih0bXBfYWRldikpDQo+DQo+IGRybV9zY2hlZF9yZXN1
Ym1pdF9qb2JzKCZyaW5nLT5zY2hlZCk7DQo+DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBk
cm1fc2NoZWRfc3RhcnQoJnJpbmctPnNjaGVkLA0KPiAhdG1wX2FkZXYtPmFzaWNfcmVzZXRfcmVz
KTsNCj4gLS0NCj4gMi4yNS4xDQo+DQoNCg==

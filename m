Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 646C510D9A3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 19:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584366E956;
	Fri, 29 Nov 2019 18:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750073.outbound.protection.outlook.com [40.107.75.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A886E956
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 18:31:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkOIWgOGbyh2VQm5M6kJzCtJOsnPMcMbToDEcAlFEiLRvbtLdta70p1d5lAjcVbP3zwJq5euTi9LJ1Xrf9gGEOsIkyWPoKn7yDmzW72xxi0e+nSwrikXfMKOLCoUt8k7tk270CBiPnwB9ppJ3YHpsXzbSHOXbbYIZUKAJfa0YlTpzT8UHwTukwkmY+9XghZIkIeT9ntJK2tE4ihqjfhTW7+bH/vCDvuIIzyCZpORDrONpdAhtqU5skZ0+Ug/9JpGKthJAIQ4N8qFMtYoEVMWFyFRZs6Nnu/+eUY6QiZlFIhOijX7uFD0mBzJ8E0KusylArWsH9lp8SB6vWD/BFm3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYCzWrIcjrjN5CsU6T9NylaHZOnuinsToVLas8ONvuk=;
 b=AdgGSgqYDsVR2gZ8fMV6gkMIhJ+YRlTIzd5bwOg81kcWMaasUrIv/fwZx+hDL9rAErsdXeYIJJrs6efmLow/xiIqStB0ocawcYYDKIQV+oYSo4ZprMvO0itshG292eTiWWSnRbFpFknOcOwAkhWu42DIwskpzgv2gMXIKbCcviU5iKYuiA3++iqmusYQV4JjFv0Y0Vkyhi14jgjRK80pT1n4IoSYCFOA6c53oG6q3OkxheDMZMlvmSjXavhjoxg2Cv3pJ9lvM6rgxlwDkTyxVgt/UAzW3XRigM1fXubM9tKrhcKs89fd58em80hQJyVFWO5xrOFAhQVHrHEPlokqbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1209.namprd12.prod.outlook.com (10.168.234.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Fri, 29 Nov 2019 18:31:20 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84%12]) with mapi id 15.20.2495.014; Fri, 29 Nov 2019
 18:31:20 +0000
Subject: Re: [PATCH 2/2] drm/sched: remove superfluous whitespace in
 drm_sched_resubmit_jobs
To: Lucas Stach <l.stach@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <20191129132643.7828-1-l.stach@pengutronix.de>
 <20191129132643.7828-2-l.stach@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ae0c45b5-1480-905d-c2a1-41f4e437d31c@amd.com>
Date: Fri, 29 Nov 2019 19:31:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20191129132643.7828-2-l.stach@pengutronix.de>
Content-Language: en-US
X-ClientProxiedBy: ZR0P278CA0012.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::22) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9aeaa63a-b72a-4f85-4bef-08d774fa5400
X-MS-TrafficTypeDiagnostic: DM5PR12MB1209:|DM5PR12MB1209:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1209E32CC812E1A0FF67B30D83460@DM5PR12MB1209.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-Forefront-PRVS: 0236114672
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(189003)(199004)(14454004)(58126008)(7736002)(5660300002)(110136005)(478600001)(65806001)(2906002)(6636002)(47776003)(99286004)(6116002)(305945005)(65956001)(36756003)(2870700001)(6666004)(316002)(50466002)(66556008)(229853002)(4326008)(25786009)(31696002)(8936002)(81166006)(81156014)(66946007)(6246003)(66476007)(86362001)(23676004)(2486003)(6486002)(8676002)(386003)(6506007)(31686004)(446003)(11346002)(76176011)(4744005)(6512007)(186003)(6436002)(2616005)(46003)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1209;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PnfFMEv6aeE14ynihwri5pNRgqI2se/Eiuts1E+bfyVEaz+OWBaawJjiKcpLmP6ShIimDtAOBe/A2ACNr5s+nEZaug160AcOuauALmUXBbB31QH1iU66lr9CnokvbkuiJWP7fp4ALGV2l4lddioT7viB6pORBs/Jl5Wi+bfacVyeYDaM/BJM5+8hir4Qvlt+RMPsehMOWrk6i0eVSka9IBRAjeBE5WDiJBP44lU2Ld93m/+72Yjb+W3XHVxDDAna0sMdye7H0fdraVJkCKIQE/y42xahjfmqzijFjx0/AJ5nFRPmTPrjdlN89AfowyHY1q+8Oyva203vgKrKECR15dOl7A/WYS4r0cdjvgrDIFe79YOs3WSb9JUEP7OFVNQxE8mcKLSR2n3xZzDaOeDCdzG0uGgxw4MI8Nt4RIyyCQhdlrwCknQ/F3UUiq4vrHZs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aeaa63a-b72a-4f85-4bef-08d774fa5400
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2019 18:31:20.1773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRpwQ2yXNiPEfxIPF5vJMQRCoCaz9AWZIfFIe7ZtYomnZOGmxhTAiO0PMFD0oG7Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1209
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYCzWrIcjrjN5CsU6T9NylaHZOnuinsToVLas8ONvuk=;
 b=BJ509irCuRkwux+g6NIQL5wiEAGbG0QXhEZpyr85RNrLhQQWH5Dc/HAhHENkc90pCeZ1Hj6sAB33oCfDN8hanfHJq+7mpmCbdF2vpKyloKIv2Uqd0N0m11U08Egr9MUYfHkDWC0chVzhaGC6ik+spks3nj3pmOIEqSQW/acylFE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjkuMTEuMTkgdW0gMTQ6MjYgc2NocmllYiBMdWNhcyBTdGFjaDoKPiBTaWduZWQtb2ZmLWJ5
OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KClJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAyIC0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5j
Cj4gaW5kZXggNTk2YTI4ZDkwZTVjLi5kNmVmYjM1NDA0YTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX21haW4uYwo+IEBAIC01MDEsOCArNTAxLDYgQEAgdm9pZCBkcm1fc2No
ZWRfcmVzdWJtaXRfam9icyhzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQo+ICAgCQl9
IGVsc2Ugewo+ICAgCQkJc19qb2ItPnNfZmVuY2UtPnBhcmVudCA9IGZlbmNlOwo+ICAgCQl9Cj4g
LQo+IC0KPiAgIAl9Cj4gICB9Cj4gICBFWFBPUlRfU1lNQk9MKGRybV9zY2hlZF9yZXN1Ym1pdF9q
b2JzKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

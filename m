Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28735CF705
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 12:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09DE6E0E9;
	Tue,  8 Oct 2019 10:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150053.outbound.protection.outlook.com [40.107.15.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F6B6E0E9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 10:28:44 +0000 (UTC)
Received: from VE1PR08CA0016.eurprd08.prod.outlook.com (2603:10a6:803:104::29)
 by VI1PR08MB4013.eurprd08.prod.outlook.com (2603:10a6:803:e1::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Tue, 8 Oct
 2019 10:28:40 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by VE1PR08CA0016.outlook.office365.com
 (2603:10a6:803:104::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.24 via Frontend
 Transport; Tue, 8 Oct 2019 10:28:39 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 8 Oct 2019 10:28:38 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Tue, 08 Oct 2019 10:28:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fcdc1b926c903599
X-CR-MTA-TID: 64aa7808
Received: from 7d1a11ecc814.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3E5DA66B-3A34-46F3-988A-BD55F1132A2D.1; 
 Tue, 08 Oct 2019 10:28:28 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7d1a11ecc814.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Oct 2019 10:28:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJbZCaggQ1QpRxU0JAyjSuqjHKebOGRPp993iLpd0DZg+Ioah8DPHqUEhB+KmmW7RJzssvklJ9/Unp5W4yYD9+Ar6P4ZtSSVxXqP7fIfK1t/WqE/FuQbLubI0I1C9J2WP/uH9OScguBGRXqIK20Vppp6IDG/Rwj7QezWV9/2WwTwGTFgDBaaElt7k7bOfP5wKerP+wWT9gH7Za7NjRxB88/kdG+tmE8k8lZWEYyS4MiivndCBXyubmZe/kO3Kwpvrw1zEmrQ1Y5v846vXx7Hf8kOjBm1+Uf1OfnwNxgD+wS5gtZKHG20kr4FV8VKAJYbfBfGAUKOcAV2z66AImiVpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPNGZySh5tbQWwzpDrCrSOF1r9jnKxKVQYd9aaqlqQ4=;
 b=Z6l1YIVVuURy05eLeQEWP4yhOFzXaDPaPHefQd2P0SMfiWj+jlRzO4+yUV85JCyOkmoszcq4zqQTn+vmsVMX2Juf1b0dR69E5kFchTET+cer7m0HDiG4xKKn+FbU1ZHxVkhm59FV9EWAjaztNIfxDzRLu4hm1iX/TOflRisaPfoFMPBZmWShr4cG5HSYudVnOTzH9tRRjrNC3p0IewF3PyccpYSCasF/Zcz2Ff+M2tH+77i+x5VYFPAFUTxR8JFl3iBvqYm3dQ0l3ELctM57tpgUWHr+cwazkm4Tv0N1yTFf2gFEsapqHpdjc2nR2hY3seaKFllhiIcBw1viOJRZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB4366.eurprd08.prod.outlook.com (20.179.27.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 10:28:25 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9%4]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 10:28:24 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [PATCH] drm/komeda: Set output color depth for output
Thread-Topic: [PATCH] drm/komeda: Set output color depth for output
Thread-Index: AQHVfblD7I+ubO1huUCp0qQz7Z0Q4adQfC0AgAAOlYA=
Date: Tue, 8 Oct 2019 10:28:24 +0000
Message-ID: <20191008102818.GB16398@lowli01-ThinkStation-P300>
References: <20191008091734.19509-1-lowry.li@arm.com>
 <20191008093608.eyr5ygc2lkkaaqia@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20191008093608.eyr5ygc2lkkaaqia@DESKTOP-E1NTVVP.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0112.apcprd03.prod.outlook.com
 (2603:1096:203:b0::28) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5abc6527-bf74-4bf2-0d82-08d74bda4853
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB4366:|VI1PR08MB4366:|VI1PR08MB4013:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB401310462FC88378E719CEEC9F9A0@VI1PR08MB4013.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
x-forefront-prvs: 01842C458A
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(366004)(136003)(39860400002)(396003)(376002)(189003)(199004)(33716001)(66066001)(6506007)(66446008)(386003)(66556008)(2906002)(256004)(66946007)(64756008)(66476007)(5660300002)(3846002)(81166006)(81156014)(8936002)(8676002)(6116002)(86362001)(4326008)(6862004)(71200400001)(71190400001)(14444005)(1076003)(486006)(6636002)(476003)(11346002)(446003)(14454004)(186003)(305945005)(7736002)(6436002)(6486002)(9686003)(58126008)(6246003)(52116002)(102836004)(55236004)(26005)(229853002)(76176011)(478600001)(6512007)(99286004)(316002)(25786009)(54906003)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4366;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2Oq984W2kMQwIBfNEbOj0YlF0aVULdMQqjfOFzBlYYkoD5WbNMEiMKlxmkru9+4L+C/X9uphjqx+/OnUMxiC2MZXzNra/8OSofuJxHo9htfV6jHfO8efHLDnsYzcqKqIzcqjzoFbBE7lmyvnoSt9sGk+aCo97bEhObLj0LFigkmk39gHp9APb1eH15BLw2EtK56DbYvVeYKbIOChMeLlcXc5rlHSCNHm/JBURB7GLSD0pE6AK2D7Z3qWyxkAUAdSpk9zVlG+HXFw6/ou0wGcB5TIOMq4pY4p1MV6UXazcVoKLQIIJ1aAOf6EoBSTn4YJOK++VLO9wU9zHcQEL/rvpBUP4kqk2WzeGkJpQqUgsWA1OQkUw+lReBL/+o1RdsgcE/iWayG9ivMKV2YTCGDZ3aT9ZPXxxaMj3ijcBpX7hlo=
Content-ID: <371424AD66FA3C48A41751D5F5BBDE57@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4366
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(376002)(39860400002)(136003)(346002)(199004)(189003)(316002)(229853002)(6486002)(25786009)(54906003)(4326008)(6246003)(81156014)(97756001)(81166006)(58126008)(8676002)(36906005)(46406003)(8936002)(8746002)(6512007)(9686003)(23726003)(6862004)(6116002)(3846002)(14444005)(2906002)(186003)(99286004)(478600001)(446003)(11346002)(126002)(486006)(336012)(26826003)(70586007)(33716001)(70206006)(476003)(22756006)(33656002)(76176011)(6506007)(47776003)(386003)(5660300002)(86362001)(66066001)(102836004)(63350400001)(26005)(50466002)(7736002)(76130400001)(1076003)(356004)(6636002)(305945005)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4013;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f2253c33-aebd-4ea4-fb40-08d74bda4014
NoDisclaimer: True
X-Forefront-PRVS: 01842C458A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: glx0vrjugh2O/vUdt2RxjstGKSfyqtBLQyQjtMetvqdEGpWgJCcrBHfKNmFnvQUXl4dTAVi82W22t1BJLijvx+wRRKC2iG/VdVkkK7ZsHPxu24EeIJIXF0up8zUbuh8G/A/Ztk84rVbKldiIbAXReXvWqPyL7IKx6eVcm6Kc4t3jW9LmBXSGM8ug7gNp+vDqZIYImB/5kQBDY83MKcXUo9Ioz/tlLHhiMsdWEb4LxErOPbJn4b5tzZ/BjidzV70Fvijh8s2dwsHMw0uiVVFbACT/RbkqkCcsPIDF3jCxbJDwEBEq3JI/iyt2iZFv23/l+91HGBpDyv1URI5I6eh9sAImWHg7S6vh3SjIuwEkneDQf/kWWM/uSRjKN0K9Vdba/jZPnU03HIy/O4vdGgo5knlqtnPaKjf31w3iiSrS9Ho=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2019 10:28:38.3299 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abc6527-bf74-4bf2-0d82-08d74bda4853
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4013
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPNGZySh5tbQWwzpDrCrSOF1r9jnKxKVQYd9aaqlqQ4=;
 b=Tgelro89Wl+I6PrlZzegY9NEjXPrW6x3AkXHsdBXSDeW5tfiscz9EisQdYhi57c0bJZxjHMYOXy6HsH9SIzLSnMB7eryWHHGR7W7l1A9mW210l3wnq7hl4elCA4dHehcFOzGJy9fOpHtNVn8MoRnEF+8Q0lHXVVf/xSKn7hJ8rM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPNGZySh5tbQWwzpDrCrSOF1r9jnKxKVQYd9aaqlqQ4=;
 b=Tgelro89Wl+I6PrlZzegY9NEjXPrW6x3AkXHsdBXSDeW5tfiscz9EisQdYhi57c0bJZxjHMYOXy6HsH9SIzLSnMB7eryWHHGR7W7l1A9mW210l3wnq7hl4elCA4dHehcFOzGJy9fOpHtNVn8MoRnEF+8Q0lHXVVf/xSKn7hJ8rM=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQnJpYW4sCk9uIFR1ZSwgT2N0IDA4LCAyMDE5IGF0IDA5OjM2OjA5QU0gKzAwMDAsIEJyaWFu
IFN0YXJrZXkgd3JvdGU6Cj4gSGkgTG93cnksCj4gCj4gT24gVHVlLCBPY3QgMDgsIDIwMTkgYXQg
MDk6MTc6NTJBTSArMDAwMCwgTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToK
PiA+IFNldCBjb2xvcl9kZXB0aCBhY2NvcmRpbmcgdG8gY29ubmVjdG9yLT5icGMuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5Lmxp
QGFybS5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29t
cG9uZW50LmMgICAgfCAgMSArCj4gPiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jcnRjLmMgIHwgMjAgKysrKysrKysrKysrKysrKysrKwo+ID4gIC4uLi9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggICB8ICAyICsrCj4gPiAgLi4uL2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggIHwgIDEgKwo+ID4gIC4uLi9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyAgICB8IDE5ICsrKysrKysrKysrKysrKysr
Kwo+ID4gIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jICB8ICA0
ICsrKysKPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21w
b25lbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21w
b25lbnQuYwo+ID4gaW5kZXggYzNkMjljMGIwNTFiLi4yN2NkYjAzNTczYzEgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50
LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9j
b21wb25lbnQuYwo+ID4gQEAgLTk1MSw2ICs5NTEsNyBAQCBzdGF0aWMgdm9pZCBkNzFfaW1wcm9j
X3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKPiA+ICAJCQkgICAgICAgdG9fZDcx
X2lucHV0X2lkKHN0YXRlLCBpbmRleCkpOwo+ID4gIAo+ID4gIAltYWxpZHBfd3JpdGUzMihyZWcs
IEJMS19TSVpFLCBIVl9TSVpFKHN0LT5oc2l6ZSwgc3QtPnZzaXplKSk7Cj4gPiArCW1hbGlkcF93
cml0ZTMyKHJlZywgSVBTX0RFUFRILCBzdC0+Y29sb3JfZGVwdGgpOwo+ID4gIH0KPiA+ICAKPiA+
ICBzdGF0aWMgdm9pZCBkNzFfaW1wcm9jX2R1bXAoc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmMs
IHN0cnVjdCBzZXFfZmlsZSAqc2YpCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gPiBpbmRleCA3NTI2M2Q4Y2QwYmQuLmJhYTk4NmI3
MDg3NiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2NydGMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY3J0Yy5jCj4gPiBAQCAtMTcsNiArMTcsMjYgQEAKPiA+ICAjaW5jbHVkZSAia29t
ZWRhX2Rldi5oIgo+ID4gICNpbmNsdWRlICJrb21lZGFfa21zLmgiCj4gPiAgCj4gPiArdm9pZCBr
b21lZGFfY3J0Y19nZXRfY29sb3JfY29uZmlnKHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19z
dCwKPiA+ICsJCQkJICB1MzIgKmNvbG9yX2RlcHRocykKPiA+ICt7Cj4gPiArCXN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uOwo+ID4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9z
dDsKPiA+ICsJaW50IGksIG1pbl9icGMgPSAzMSwgY29ubl9icGMgPSAwOwo+ID4gKwo+ID4gKwlm
b3JfZWFjaF9uZXdfY29ubmVjdG9yX2luX3N0YXRlKGNydGNfc3QtPnN0YXRlLCBjb25uLCBjb25u
X3N0LCBpKSB7Cj4gPiArCQlpZiAoY29ubl9zdC0+Y3J0YyAhPSBjcnRjX3N0LT5jcnRjKQo+ID4g
KwkJCWNvbnRpbnVlOwo+ID4gKwo+ID4gKwkJY29ubl9icGMgPSBjb25uLT5kaXNwbGF5X2luZm8u
YnBjID8gY29ubi0+ZGlzcGxheV9pbmZvLmJwYyA6IDg7Cj4gCj4gV2UgY2FuIGhhdmUgbXVsdGlw
bGUgY29ubmVjdG9ycyBvbiBhIHNpbmdsZSBDUlRDIChlLmcuIG5vcm1hbCArCj4gd3JpdGViYWNr
KSwgc28gd2hhdCdzIHRoZSBleHBlY3RlZCBiZWhhdmlvdXIgaGVyZSBpbiB0aGF0IGNhc2U/Cj4g
Cj4gPiArCj4gPiArCQlpZiAoY29ubl9icGMgPCBtaW5fYnBjKQo+ID4gKwkJCW1pbl9icGMgPSBj
b25uX2JwYzsKPiA+ICsJfQo+ID4gKwo+ID4gKwkqY29sb3JfZGVwdGhzID0gR0VOTUFTSyhjb25u
X2JwYywgMCk7Cj4gPiArfQo+ID4gKwo+ID4gIHN0YXRpYyB2b2lkIGtvbWVkYV9jcnRjX3VwZGF0
ZV9jbG9ja19yYXRpbyhzdHJ1Y3Qga29tZWRhX2NydGNfc3RhdGUgKmtjcnRjX3N0KQo+ID4gIHsK
PiA+ICAJdTY0IHB4bGNsaywgYWNsazsKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2ttcy5oCj4gPiBpbmRleCA0NWM0OThlMTVlN2EuLmE0MjUwMzQ1
MWI1ZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2ttcy5oCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9rbXMuaAo+ID4gQEAgLTE2Niw2ICsxNjYsOCBAQCBzdGF0aWMgaW5saW5lIGJvb2wg
aGFzX2ZsaXBfaCh1MzIgcm90KQo+ID4gIAkJcmV0dXJuICEhKHJvdGF0aW9uICYgRFJNX01PREVf
UkVGTEVDVF9YKTsKPiA+ICB9Cj4gPiAgCj4gPiArdm9pZCBrb21lZGFfY3J0Y19nZXRfY29sb3Jf
Y29uZmlnKHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCwKPiA+ICsJCQkJICB1MzIgKmNv
bG9yX2RlcHRocyk7Cj4gPiAgdW5zaWduZWQgbG9uZyBrb21lZGFfY3J0Y19nZXRfYWNsayhzdHJ1
Y3Qga29tZWRhX2NydGNfc3RhdGUgKmtjcnRjX3N0KTsKPiA+ICAKPiA+ICBpbnQga29tZWRhX2tt
c19zZXR1cF9jcnRjcyhzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywgc3RydWN0IGtvbWVkYV9k
ZXYgKm1kZXYpOwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX3BpcGVsaW5lLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9waXBlbGluZS5oCj4gPiBpbmRleCBiMzIyZjUyYmE4ZjIuLjc2NTNmMTM0YThl
YiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX3BpcGVsaW5lLmgKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BpcGVsaW5lLmgKPiA+IEBAIC0zMjMsNiArMzIzLDcgQEAgc3RydWN0IGtvbWVk
YV9pbXByb2Mgewo+ID4gIAo+ID4gIHN0cnVjdCBrb21lZGFfaW1wcm9jX3N0YXRlIHsKPiA+ICAJ
c3RydWN0IGtvbWVkYV9jb21wb25lbnRfc3RhdGUgYmFzZTsKPiA+ICsJdTggY29sb3JfZGVwdGg7
Cj4gPiAgCXUxNiBoc2l6ZSwgdnNpemU7Cj4gPiAgfTsKPiA+ICAKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3Rh
dGUuYwo+ID4gaW5kZXggMGJhOWM2YWEzNzA4Li5lNjhlOGY4NWFiMjcgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0
ZS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9w
aXBlbGluZV9zdGF0ZS5jCj4gPiBAQCAtNzQzLDYgKzc0Myw3IEBAIGtvbWVkYV9pbXByb2NfdmFs
aWRhdGUoc3RydWN0IGtvbWVkYV9pbXByb2MgKmltcHJvYywKPiA+ICAJCSAgICAgICBzdHJ1Y3Qg
a29tZWRhX2RhdGFfZmxvd19jZmcgKmRmbG93KQo+ID4gIHsKPiA+ICAJc3RydWN0IGRybV9jcnRj
ICpjcnRjID0ga2NydGNfc3QtPmJhc2UuY3J0YzsKPiA+ICsJc3RydWN0IGRybV9jcnRjX3N0YXRl
ICpjcnRjX3N0ID0gJmtjcnRjX3N0LT5iYXNlOwo+ID4gIAlzdHJ1Y3Qga29tZWRhX2NvbXBvbmVu
dF9zdGF0ZSAqY19zdDsKPiA+ICAJc3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgKnN0Owo+ID4g
IAo+ID4gQEAgLTc1Niw2ICs3NTcsMjQgQEAga29tZWRhX2ltcHJvY192YWxpZGF0ZShzdHJ1Y3Qg
a29tZWRhX2ltcHJvYyAqaW1wcm9jLAo+ID4gIAlzdC0+aHNpemUgPSBkZmxvdy0+aW5fdzsKPiA+
ICAJc3QtPnZzaXplID0gZGZsb3ctPmluX2g7Cj4gPiAgCj4gPiArCWlmIChkcm1fYXRvbWljX2Ny
dGNfbmVlZHNfbW9kZXNldChjcnRjX3N0KSkgewo+ID4gKwkJdTMyIG91dHB1dF9kZXB0aHM7Cj4g
PiArCQl1MzIgYXZhaWxfZGVwdGhzOwo+ID4gKwo+ID4gKwkJa29tZWRhX2NydGNfZ2V0X2NvbG9y
X2NvbmZpZyhjcnRjX3N0LAo+ID4gKwkJCQkJICAgICAmb3V0cHV0X2RlcHRocyk7Cj4gPiArCj4g
PiArCQlhdmFpbF9kZXB0aHMgPSBvdXRwdXRfZGVwdGhzICYgaW1wcm9jLT5zdXBwb3J0ZWRfY29s
b3JfZGVwdGhzOwo+ID4gKwkJaWYgKGF2YWlsX2RlcHRocyA9PSAwKSB7Cj4gPiArCQkJRFJNX0RF
QlVHX0FUT01JQygiTm8gYXZhaWxhYmxlIGNvbG9yIGRlcHRocywgY29ubiBkZXB0aHM6IDB4JXgg
JiBkaXNwbGF5OiAweCV4XG4iLAo+ID4gKwkJCQkJIG91dHB1dF9kZXB0aHMsCj4gPiArCQkJCQkg
aW1wcm9jLT5zdXBwb3J0ZWRfY29sb3JfZGVwdGhzKTsKPiA+ICsJCQlyZXR1cm4gLUVJTlZBTDsK
PiA+ICsJCX0KPiA+ICsKPiA+ICsJCXN0LT5jb2xvcl9kZXB0aCA9IF9fZmxzKGF2YWlsX2RlcHRo
cyk7Cj4gPiArCX0KPiA+ICsKPiA+ICAJa29tZWRhX2NvbXBvbmVudF9hZGRfaW5wdXQoJnN0LT5i
YXNlLCAmZGZsb3ctPmlucHV0LCAwKTsKPiA+ICAJa29tZWRhX2NvbXBvbmVudF9zZXRfb3V0cHV0
KCZkZmxvdy0+aW5wdXQsICZpbXByb2MtPmJhc2UsIDApOwo+ID4gIAo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5j
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9y
LmMKPiA+IGluZGV4IDI4NTFjYWM5NGQ4Ni4uNzQwYTgxMjUwNjMwIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMK
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nv
bm5lY3Rvci5jCj4gPiBAQCAtMTQyLDYgKzE0Miw3IEBAIHN0YXRpYyBpbnQga29tZWRhX3diX2Nv
bm5lY3Rvcl9hZGQoc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCj4gPiAgCXN0cnVjdCBrb21l
ZGFfZGV2ICptZGV2ID0ga21zLT5iYXNlLmRldl9wcml2YXRlOwo+ID4gIAlzdHJ1Y3Qga29tZWRh
X3diX2Nvbm5lY3RvciAqa3diX2Nvbm47Cj4gPiAgCXN0cnVjdCBkcm1fd3JpdGViYWNrX2Nvbm5l
Y3RvciAqd2JfY29ubjsKPiA+ICsJc3RydWN0IGRybV9kaXNwbGF5X2luZm8gKmluZm87Cj4gPiAg
CXUzMiAqZm9ybWF0cywgbl9mb3JtYXRzID0gMDsKPiA+ICAJaW50IGVycjsKPiA+ICAKPiA+IEBA
IC0xNzEsNiArMTcyLDkgQEAgc3RhdGljIGludCBrb21lZGFfd2JfY29ubmVjdG9yX2FkZChzdHJ1
Y3Qga29tZWRhX2ttc19kZXYgKmttcywKPiA+ICAKPiA+ICAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJf
YWRkKCZ3Yl9jb25uLT5iYXNlLCAma29tZWRhX3diX2Nvbm5faGVscGVyX2Z1bmNzKTsKPiA+ICAK
PiA+ICsJaW5mbyA9ICZrd2JfY29ubi0+YmFzZS5iYXNlLmRpc3BsYXlfaW5mbzsKPiA+ICsJaW5m
by0+YnBjID0gX19mbHMoa2NydGMtPm1hc3Rlci0+aW1wcm9jLT5zdXBwb3J0ZWRfY29sb3JfZGVw
dGhzKTsKPiA+ICsKPiAKPiBUaGUgSVBTIGNvbG9yIGRlcHRoIGRvZXNuJ3QgcmVhbGx5IGFwcGx5
IHRvIHdyaXRlYmFjay4gTWF5YmUgd2Ugc2hvdWxkCj4ganVzdCBza2lwIHRoZSB3cml0ZWJhY2sg
Y29ubmVjdG9yPwo+IAo+IFRoYW5rcywKPiAtQnJpYW4KPiAKWWVzLCB0aGUgY29sb3IgZGVwdGgg
bm90IGFwcGx5IHRvIHdyaXRlYmFjay4gV2UgYWRkcyBpdCBiZWNhdXNlOgoKSW4gdGhlIGtvbWVk
YV9jcnRjX2dldF9jb2xvcl9jb25maWcoKSB3aWxsIGxvb3AgYWxsIGNvbm5lY3RvcnMgb2YgQ1JU
QwppbmNsdWRpbmcgdGhlIHdiX2Nvbm4sIHNpbmNlIGNydGMgYWx3YXlzIGhhcyB3Yl9jb25uLiBJ
ZiBub3Qgc2V0dGluZwpoZXJlLCB3Yl9jb25uLT5icGMgd2lsbCBiZSBzZXQgaXQgdG8gOGJpdCBm
b3JjZWx5IGluIGtvbWVkYV9jcnRjX2dldF9jb2xvcl9jb25maWcoKSB3aGljaCB3aWxsIGxlYWQg
Y3J0YyBicGMgdG8gOGJpdHMgYWxsIHRoZSB0aW1lLiBTbyB3ZSBhcmUgc2V0dGluZyB0aGUKbGFy
Z2VzdCBzdXBwb3J0ZWQgZGVwdGggdG8ga3diX2Nvbm4tPmJwYyBoZXJlLgoKPiA+ICAJa2NydGMt
PndiX2Nvbm4gPSBrd2JfY29ubjsKPiA+ICAKPiA+ICAJcmV0dXJuIDA7Cj4gPiAtLSAKPiA+IDIu
MTcuMQo+ID4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

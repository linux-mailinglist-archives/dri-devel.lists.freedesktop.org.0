Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE4D5BD87
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 16:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3265289AEE;
	Mon,  1 Jul 2019 14:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300089.outbound.protection.outlook.com [40.107.130.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F52889AEE
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 14:02:55 +0000 (UTC)
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
 SG2PR01MB3454.apcprd01.prod.exchangelabs.com (52.132.233.82) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 14:02:52 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::d503:3d71:ce06:19d2]) by SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::d503:3d71:ce06:19d2%6]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 14:02:52 +0000
From: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: What is Direct Rendering Infrastructure (DRI)?
Thread-Topic: What is Direct Rendering Infrastructure (DRI)?
Thread-Index: AdUwFYbMeWNyxcI0TAy1uyc/zs3OMg==
Date: Mon, 1 Jul 2019 14:02:52 +0000
Message-ID: <SG2PR01MB21414EF7B74790857F5B06F387F90@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [118.189.211.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3925d50c-dcb9-45c8-6505-08d6fe2ccf30
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:SG2PR01MB3454; 
x-ms-traffictypediagnostic: SG2PR01MB3454:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <SG2PR01MB3454256557B94B7307928F2E87F90@SG2PR01MB3454.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(136003)(39830400003)(366004)(189003)(199004)(73956011)(14454004)(76116006)(7696005)(66556008)(966005)(33656002)(476003)(66446008)(81166006)(81156014)(2351001)(8676002)(3846002)(6116002)(102836004)(6506007)(86362001)(2501003)(71200400001)(71190400001)(74316002)(256004)(26005)(7736002)(186003)(8936002)(305945005)(99286004)(64756008)(66476007)(66946007)(316002)(4326008)(6436002)(55016002)(6916009)(5640700003)(9686003)(53936002)(6306002)(25786009)(2906002)(52536014)(68736007)(66066001)(107886003)(486006)(4744005)(5660300002)(508600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SG2PR01MB3454;
 H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VzTU+VS31GK7GbIQFLv03ER8vSbRmDxIARK6+NY9MC4fOn0X9aCiTsUlBKR+Kr0PE7LfNKEEryTBBvKl5pCHw/Vh00GTKOTwUQDc5kGvb1OdEBnrASJ2+E+ONKoDzKWfHGBde2mOX4r2dBhCTMIL3B4OAGsXQeejjmcpOtfM18usDJ4CRZT/8OI7kCgpFNkdAjwBwpeMDqsl56V4cEPn0nUpF1IsHok4xCXoWE0MTEXY0nDNhhNeYXYhKN0y0ftZhkx3D2B/ERXUDheIvVQvp/tF0EPSxi758vD1ntXtUkg+oqDRJjhgOZ4/GD4lKMdMQJPWn99nCq799xEpVresIvJ0y+GZLRVfMy3ieOnorkFsLeJj+1xDM9g1b4rbez+Z/H/doi3I3IXzlDZad4TXdeHIMZvlKmkLSYIuAWee90I=
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3925d50c-dcb9-45c8-6505-08d6fe2ccf30
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 14:02:52.5756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ceo@teo-en-ming-corp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB3454
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector1-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfBL6Ps34wVdmNUqJuS6E6KY0B0+ALFMTLu8m8F0Ya8=;
 b=HNE2v4Txx7zAf2lmVjoSEBVmjMW9GK6R9DjPGL5FkSviFQMgK9Y4t86vx7m/RxalTH51900/rU203vm0onXR2sgywunUaMaeGJSC8A9hApJpvWhXveuo2Bzt5C+cRrILDjPJFPfnDHGvNNqheLbgP1Y8pkaaFEPD1TDRDpG3xcU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
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
Cc: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R29vZCBldmVuaW5nIGZyb20gU2luZ2Fwb3JlLAoKTWF5IEkga25vdyB3aGF0IGlzIERpcmVjdCBS
ZW5kZXJpbmcgSW5mcmFzdHJ1Y3R1cmUgKERSSSk/CgpUaGFuayB5b3UuCgotLS0tLUJFR0lOIEVN
QUlMIFNJR05BVFVSRS0tLS0tCgpUaGUgR29zcGVsIGZvciBhbGwgVGFyZ2V0ZWQgSW5kaXZpZHVh
bHMgKFRJcyk6CgpbVGhlIE5ldyBZb3JrIFRpbWVzXSBNaWNyb3dhdmUgV2VhcG9ucyBBcmUgUHJp
bWUgU3VzcGVjdCBpbiBJbGxzIG9mClUuUy4gRW1iYXNzeSBXb3JrZXJzCgpMaW5rOiBodHRwczov
L3d3dy5ueXRpbWVzLmNvbS8yMDE4LzA5LzAxL3NjaWVuY2Uvc29uaWMtYXR0YWNrLWN1YmEtbWlj
cm93YXZlLmh0bWwKCioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCgpTaW5nYXBv
cmVhbiBNci4gVHVycml0b3BzaXMgRG9ocm5paSBUZW8gRW4gTWluZydzIEFjYWRlbWljClF1YWxp
ZmljYXRpb25zIGFzIGF0IDE0IEZlYiAyMDE5CgpbMV0gaHR0cHM6Ly90ZHRlbWNlcnRzLndvcmRw
cmVzcy5jb20vCgpbMl0gaHR0cHM6Ly90ZHRlbWNlcnRzLmJsb2dzcG90LnNnLwoKWzNdIGh0dHBz
Oi8vd3d3LnNjcmliZC5jb20vdXNlci8yNzAxMjUwNDkvVGVvLUVuLU1pbmcKCi0tLS0tRU5EIEVN
QUlMIFNJR05BVFVSRS0tLS0tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=

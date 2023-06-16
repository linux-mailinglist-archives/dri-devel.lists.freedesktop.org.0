Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418E473308D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 13:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A197D10E5F8;
	Fri, 16 Jun 2023 11:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB59610E5FF
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 11:58:13 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35GBQ1P9023810; Fri, 16 Jun 2023 12:28:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=hOE0aV+W5l/Hpp/4lSRUVG3WRcz7nJjsPNAAR1N5XBY=; b=
 tcrsJ1P1x4CkpX8wYfPxt/Nt2WypVNJmf6YPcKwMnuyayQ77HuWC84iWWSHiXzhn
 GmAcbyl5GexT7j9OLwDWtCB8NXLtnmBOpDlNpw3Yiuw+H3K3fcWzIwUvZzm0rsH/
 mPXLcB6UcR0KS/hFZj34MqdUMeJa6EnXxW48+laMqCRPz+zNsv0jICemwbvxlpYV
 dhb7c0L8KVZQPBT/ElE2T3W0dMyjc/31vsHDLjlDeeV2KoTq9ghvW3+zkU4AmkqJ
 vrPT51z/bRV5TlhKMKNQGRBMcd2m7t0Esn8CE6zSuy83UntDcjtIL89BpoEsWHJZ
 rKRL05iI7byvPSSuyhtrtw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3r4fermr63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 16 Jun 2023 12:28:00 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 12:28:00 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.52) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Fri, 16 Jun 2023 12:28:00 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIpG5fKwflsx7/abQcnoxsJhiLvfrhszDe9WBpBDhjtBd0Y6AjKfmmSkOX8XwR+tKFeYjERwbqQl0pTBwwo3qBdYEH0mfSXikxsysr6hXXmOTUytkghPRlVG3wal4MS6Jc4nACUQbxzbmfXVEGJ5BmmmVeudd9D11VjQ9p41GT3o/jcW+rgZB6fp/ismHDe8nz/OOW/eTaLcjoDfkFenLfKvsOz2sEQpH9LVorqAKZVnzeWW2959aAH5DM8BUj6FHQD59V6X3uL12LkWi85dJtihryoZe/Y95kZ53p5lDT5l5/5XRRNAw+8/abax5pavZfedzrXdLP3iriEbmi6tDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOE0aV+W5l/Hpp/4lSRUVG3WRcz7nJjsPNAAR1N5XBY=;
 b=ehv+Z/8i6H1+FyDOp2XFC/4JMCHY3nqx1rwq25pVsWpWda74Td//jP6fYhQSG7ezB6uzbx2jJBRj70qGjOoU5QZrUDiaNWveWiZdFaQPP4TQ0QDgij+7lYn9w3B4xtYSCMpaM61cR7GidqXGGlRC+pdwHF6luDTO2+19y+1maxZ2kGYBdXro0Wx3D6SL+9EZepHMvLj758vqYPlE3xGXedPGLV8FLlML0wDn2om17Eau9G9GKHnlDACDA/RW04pPl5MuR/SO/y56g8w2l2GvA9OU12pPsyfOnLyzi8wnnAPzPxwf1mMRViEtqT+ga8O2AeZIf0A2CIp3D2a7eOwKAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOE0aV+W5l/Hpp/4lSRUVG3WRcz7nJjsPNAAR1N5XBY=;
 b=WASWpOJfF9GHnrH6MffDEOvvwu0LcCaO/rB9hh7aHyAluqeyqchmx+MenHiQSroapQDmTpwpYBrjt1qk0BzrHl9KrVIAb/n+KihePIBu5SyWJMSOs7I9Te2b6phdHFwwJA+HyKlAVycH8245h/9YQSugFGe4DEorrrwOEmFwiqk=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LO0P265MB5941.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:290::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.10; Fri, 16 Jun
 2023 11:27:59 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f976:8df8:e81:d5f4]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f976:8df8:e81:d5f4%3]) with mapi id 15.20.6500.026; Fri, 16 Jun 2023
 11:27:59 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "robh@kernel.org" <robh@kernel.org>, Sarah Walker <Sarah.Walker@imgtec.com>
Subject: Re: [PATCH v3 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Thread-Topic: [PATCH v3 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Thread-Index: AQHZngYUJoX1+qc/Fkehz30lNP0fw6+MWfkAgAD0koA=
Date: Fri, 16 Jun 2023 11:27:58 +0000
Message-ID: <6c2376587e5df0dab25c76b180c48545ce8ea8aa.camel@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-3-sarah.walker@imgtec.com>
 <CAL_Jsq+bhCCHLY9=ponhGn3iLwueTRgmM_tRHA5cHGAuYC88gw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+bhCCHLY9=ponhGn3iLwueTRgmM_tRHA5cHGAuYC88gw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LO0P265MB5941:EE_
x-ms-office365-filtering-correlation-id: b7dd030b-28bf-4492-9974-08db6e5cbd00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cqj2jun0DBaheg2RX2yd0M7ATtEt1wEkWreeWttetRg9pe9xmVMIBUJzQXh6wG7M5tyz0NdgwbFFXMAdTtcW3TNfv3VubxBa2qsm50zcDoro40x0J8UBq7Dz0pA2gDEkkJh11ssiHCFEAWgKZyvulgKHmeVh+5jnY5/ybpO0CfeUicwRRvvnK1jaKtPTahbXOFz7+ZTUQSrjwIbQix8Cs0Vt3avMr35sYwyk+8xZk5+w3YFtB2dSASnDY2shJeq9L5JKxAc7CB5k8SHReVed8wsEL7NiOMoanTy0dSUl8U0b+iCXu8ItTkQw1n+6usZszWh55UniGQHKTgghmFctDel4f2vMN02GXXG9U/w3l73nfvAdK4vRSZ5Hws2+i2yRRYZWB8uWRSa1Yvsr+e5D1cGQzklEesW79Hrt2F8NCPQJ31E1UX7QBoSMhrmYd+Ggu0EDK/cBwFKxf1JYQJpLsfZ3CI+JGlvnHf+Et70u7hy3ndubRfaLgUrhH2gwOqjBYN9oQp32sEkdeI2udRzSCVA11dyXWHa5++l0a2gZ0SdDsbbSW053FP+Lzp6dAuQ1gwjnH/o344IbtaOnytApyUjaIedJ8lnIx/ETBX/TGUkRPPw1BJFUkb+MOfiIVWIp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(346002)(136003)(376002)(39850400004)(451199021)(110136005)(54906003)(41300700001)(86362001)(66446008)(64756008)(66556008)(66946007)(316002)(6486002)(8676002)(8936002)(71200400001)(66476007)(76116006)(6636002)(4326008)(36756003)(478600001)(6512007)(5660300002)(26005)(6506007)(53546011)(2906002)(4744005)(186003)(38070700005)(2616005)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFpDQjYzS2pETFJpamJTNC9rUTAvSHd5VDJZNlQzWVhlMnBUL0Z0SDZ5SVJj?=
 =?utf-8?B?ZkJGSlY3MXV2Z201TGZoNlpPZStUY3JweVI1dUZXcm1KSEZ3TlJWd1Z5Unlm?=
 =?utf-8?B?MW1iM0w4bS82KzZGS3Y3YmJQdFVraCt1SGZWK3RKbmw3R3IyWmI1MEVlV3ZN?=
 =?utf-8?B?RXl4bGkreHRxQTFaZ1pBTFloaG9KRDdGNHhYcitnR0w2emdwZVdaTWFvcHNY?=
 =?utf-8?B?RFdwRFBtcUhqYUp6NG5SQy8rMTUvdHhDMERSM1Y1SnkxUWVSam5YUkdJSUZP?=
 =?utf-8?B?c2NLSXdEcGhmdDNuT3ZRQWkycEZWdHM5bEJXM1ZpWEFOdnpmdWNhSWhnYXcz?=
 =?utf-8?B?VDYzRlpqdFZSVWNHN3R1OXRXbkVIczFIeEhzSEtJcWpHSXVKYjJEZmdHWWlC?=
 =?utf-8?B?WTVkZ3RqSEE1N1Mzb2RnMW55OWs0NFZCMHJVdjN1c2hYeUxDRStHSDhGQ29o?=
 =?utf-8?B?L25mMGpacEtmbW1CUUxTTmFOV3RtSnRleHJyMWZQTzRyOWw1bUV6bDVvcWRC?=
 =?utf-8?B?SGdWRGwreTJlOGx0c1dNZFdrNWgrelArZERybHVxYWtxWGxLRWo5QXd1VDAz?=
 =?utf-8?B?RkxQVG91V1Y2Ly9odmEvdjJqUzBnbERwRnVSUk11dTIranBhTHRJUkNsbFNt?=
 =?utf-8?B?bEx2WEl1QnY2QytLMndhdE15b2wvM3ZCNVUyL3pDeGZGRXlPVEd6b1RnaVBo?=
 =?utf-8?B?bWlJRkVQcVJFTFhkcmtZelRhK2RiamMzcy9yTUQ5SkRBUXpRbGhwVFpjRTU1?=
 =?utf-8?B?aWFubC81aDgyYW1ZNGk0UGlnR3EwR2J2aG5ZZFFQaE1pOEtHcjZremlibThQ?=
 =?utf-8?B?REo1Vjk0Sm5pcEJ0dy9QcDVTdlVvOUkrdm12M3BwUG5sNGtYN0kwd05sZ1hC?=
 =?utf-8?B?ay9mZ1dLRXZFM3lkV01ySTlOd3orczBJdGNvT2dXNTdCcEVGKy82cFBNMzN2?=
 =?utf-8?B?YU5NWkl4TlN0RVBxYk9ZMlJGdEo4Y2VmMDA0Wjc5S3g1alQ4QllzQmZzb2E4?=
 =?utf-8?B?YVJXbjFWWEluRjZtQ0piYVFGU2JJZ1BwQ2dYbE1STDdaOFRCV0JQcmFjWE1N?=
 =?utf-8?B?dWpIVjFNeVBxd1N0UXpjSmxBVCtuTDNqc0dtSkhpcVZieWtzWTV5RFF3cWpv?=
 =?utf-8?B?TVhMR0FvOEJ6VDAzN3dmSjZrOXBzQklTWGdyeDUxaXBtRDF2ZzExUWgrSlBq?=
 =?utf-8?B?Z3RDaE5QK2twc1ZJZWxra0U5NFVEMktEekxrTjlpRlBWZkdqKzFmeGtQdXcy?=
 =?utf-8?B?MWorRGFwMU5MNE01RjFvUUs2U1NMTGdDZ25kNlY5U1VSaFEwaCtwQ3Yxc2pC?=
 =?utf-8?B?VHRKa1FBeWkzWVRHb3R4V2NBMFhEazVkdktsZ3lKMHVvZERKaG9FSHRxK1Ry?=
 =?utf-8?B?ZG1weTY5NEpJc1UvZXpnQ0t4OGtXd1AwaFJPcFMrN3RwK01ld2FRd3dFa2U2?=
 =?utf-8?B?Vzl3aG52dWd1dnBhenJEZDhtV1ZPaVBFWWZqVk4rQ1dHWjZoTE8rNFc5ZlYz?=
 =?utf-8?B?cS96SEdEell5aEJrdFREZWxBT1gvWCtkYUVpZXExdzQwdUpNbi9MUVllcEZ5?=
 =?utf-8?B?RWNOZmFxUnAzWE5wbHM4VllsWTZWQjZwYXdqYmZqMGVSRC9FK1Y0TGR2alJ2?=
 =?utf-8?B?enVaWnBFMVpqdXBTSW9UQmZ0OEtqcUxNMWROZzYzblFaUkNUNjc3b0Vyb1Ax?=
 =?utf-8?B?SzlMTDVwRWJQTG96TFEvYU1wZ2JMa1dRdWVTalF5UFJFN1ZXVVNQSUtjblNP?=
 =?utf-8?B?Y0w4K3FaZWZNcDhFekpQbkZLV0dsSEF1bjlsOWkyUkxxcmtYbXZsa2UycGVz?=
 =?utf-8?B?cjZQOTNYVkxyMm8vR0FVQ2h4cDJaYjY1eEF1Mys2MjJkeGJRZXFiRU5jQkdN?=
 =?utf-8?B?V3dJZHFVVGtpbWZ3cy92b2ZuZVhQTmVRRTE3a0lGSFpJNnl1WGZGNmFPNUFE?=
 =?utf-8?B?aXZSbXRMeTMxNWR2RVZ4aUtqSkN5N3IvMnI3SEx4ZTdpRmlydFVlZ2p3bmov?=
 =?utf-8?B?L3pqZ0xnaktlV21FdTlZOFQxMEpWK2I3UXpES1BFS3ZENnFOWGlDNm5kYmkw?=
 =?utf-8?B?bEFLZ0NWd1FsNk1oREZJOWJoQ25hU3ZoNjZRa0J6SDg3TWdZaTNiVGIzY1VH?=
 =?utf-8?B?b094S1VCTUFXS3ZlTklFVTRKTmY1cXJMZjFIMHF5Z2hhTXg4RUk1Mk4zTC85?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5031B950D54B644BE6F3515CEB5B9B5@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b7dd030b-28bf-4492-9974-08db6e5cbd00
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 11:27:59.0016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bYpZHKtJ279rYZBu9gmC/3Z3o9nsFxGZFdJ4tEMCdqQB3dY6OQ/ipc7BspO+HDYUd0Suw1tnc2U8JjcV5I6NQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5941
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 56EFAs8AGd90PvaLKO5wB8BijF-eWZ7z
X-Proofpoint-GUID: 56EFAs8AGd90PvaLKO5wB8BijF-eWZ7z
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLA0KDQpPbiBUaHUsIDIwMjMtMDYtMTUgYXQgMTQ6NTAgLTA2MDAsIFJvYiBIZXJyaW5n
IHdyb3RlOg0KPiBPbiBUdWUsIEp1biAxMywgMjAyMyBhdCA5OjIw4oCvQU0gU2FyYWggV2Fsa2Vy
IDxzYXJhaC53YWxrZXJAaW1ndGVjLmNvbT4gd3JvdGU6DQo+ID4gQWRkIHRoZSBkZXZpY2UgdHJl
ZSBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIHRoZSBTZXJpZXMgQVhFIEdQVSB1c2VkIGluDQo+
ID4gVEkgQU02MiBTb0NzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhcmFoIFdhbGtlciA8
c2FyYWgud2Fsa2VyQGltZ3RlYy5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2dwdS9pbWcscG93ZXJ2ci55YW1sICB8IDcxICsrKysrKysrKysrKysrKysrKysNCj4g
PiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysN
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZy
LnlhbWwNCj4gDQo+IFBsZWFzZSB1c2UgZ2V0X21haW50YWluZXJzLnBsIGFuZCBzZW5kIHlvdXIg
cGF0Y2hlcyB0byB0aGUgY29ycmVjdA0KPiBwZW9wbGUgYW5kIGxpc3RzIG9yIHRoZXkgd29uJ3Qg
Z2V0IHJldmlld2VkLg0KDQpUaGFuayB5b3UgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBXZSdsbCBt
YWtlIHN1cmUgd2UgZG8gdGhpcyBmb3IgdGhlIG5leHQNCml0ZXJhdGlvbiBvZiB0aGUgcGF0Y2hl
cy4NCg0KVGhhbmtzDQpGcmFuaw0KDQo+IA0KPiBSb2INCg==

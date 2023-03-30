Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD2B6D0A9B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 18:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4FE10EC81;
	Thu, 30 Mar 2023 16:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943F310E2B0;
 Thu, 30 Mar 2023 16:04:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYQcJYzn9eWh2k760cW1jfanbXmrFpawtTG5lNVQqKloWARdtc1bInHU7+I3iXjQhUIagde4CXcwXlqmDgWwpGvH7O81PqG/SgaTnlwesAQ4mo6CnC4HGVuXqZ5Wu4myVsO7Us5loHF6scKHSiB9R/DU3w48uE+Ax7Nub6BbrpBjcisga/L54jsxn1Hm0U6uABs/5DZ4AQuuMHNibbgIjqGFN7yzwRhUTJwOjIMyfXaq0r7CisOJCDb2eGlvEKBDwmEt6SS4m240uhN6KZvki+96N0tzts/o4wbJNJBV41Osb8aYIdkE8lwTvDTPW+voNFzXBtM66Cl7nSEEbPSYIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdC/pPpLkTJkBqziQP3Fiw9j12KaIS6U5a7exuxCEeE=;
 b=iky7PzBitpRm1wlm/IMXqHkCnvHjRzoDk7CiXPdDPo15dAtzz+694u+omk2p9JV9pUMAswL5ftDFXeBt1eGCCvHRnskNIv+qVqfX22jIzdiLif4OSS5OR2v6qrWs6394ewQKpB5Z3jXjmueFuSa+gZMTKhA6+oqnj8ml6MVJ3vZEG1DsCuhElorcnnq7dXDH+8KnUZyUfq/ygS8ho5LqQiUZbuSZDQnAXaDugY4Z2f92z1oIMrCvAaDDKwf8EvVaX585OHtwRz1zCFhimYO67x8e6mLBUphTnr4pULbpRvMwYQKjK5++45WehF/+/Aabvat7QMSErh2K+qS43ldsNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdC/pPpLkTJkBqziQP3Fiw9j12KaIS6U5a7exuxCEeE=;
 b=404kasVbppv63AaBTsrUzeya3oN9Uht0Fjr+X7qYCY7r1n63YRmmtCYQ2PWJgPjIc40LgTu6n0mJA8Cj/M+KKOd2xOEpblkgsLoSs/8XN8d951jXVV48Amcam7qS5aub6QEqbjdrTJelSEEqnLc2S1217NIAnA8sivoYqiwV8vA=
Received: from CY8PR12MB7435.namprd12.prod.outlook.com (2603:10b6:930:51::6)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 16:04:21 +0000
Received: from CY8PR12MB7435.namprd12.prod.outlook.com
 ([fe80::37b:ac1c:6025:63da]) by CY8PR12MB7435.namprd12.prod.outlook.com
 ([fe80::37b:ac1c:6025:63da%3]) with mapi id 15.20.6222.031; Thu, 30 Mar 2023
 16:04:21 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, Tom Rix <trix@redhat.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "nathan@kernel.org" <nathan@kernel.org>, "ndesaulniers@google.com"
 <ndesaulniers@google.com>
Subject: RE: [PATCH] drm/amdkfd: remove unused sq_int_priv variable
Thread-Topic: [PATCH] drm/amdkfd: remove unused sq_int_priv variable
Thread-Index: AQHZYxzBPBynE24gZUut9SNbvKqPTq8TdUuAgAAGZ9A=
Date: Thu, 30 Mar 2023 16:04:21 +0000
Message-ID: <CY8PR12MB743581364ACB8E28AB149A48858E9@CY8PR12MB7435.namprd12.prod.outlook.com>
References: <20230330152040.1838353-1-trix@redhat.com>
 <6dac0c4b-a792-849b-97be-31ad3a527e7b@amd.com>
In-Reply-To: <6dac0c4b-a792-849b-97be-31ad3a527e7b@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=a7a230e6-8738-4062-9521-d373535248a2;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-03-30T16:03:18Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7435:EE_|BL1PR12MB5288:EE_
x-ms-office365-filtering-correlation-id: 398028e4-8b99-4664-3be4-08db31386caa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NKnOD78XW2y5+RLbhhd9OWlOLNS+n+PFipnArt0eoiiqgrqVUGFsa8k6qQl7TYczzSZymLm2xBhEllcHzKJvHQIy1QoxDSPnlxUuBYYjZixzK5ZwjEe7lfKFg+N6Iwv8GhPgfPncRlYYACbeLbc0J/LkPKRcjhX+t7MEwiKbyqDwesla6clq8xuUmNe0ah1ik8RXCh67CcRNmWcAaMSxWN+98d7mgorc1PG49Gbaxb2sh7tqm85RZetB29uBx/zpP4aQBhNgWGmgUSEUckVjB95H2Vwj3navl7oMr0lnV6gBwPHPXkUA3ksWtuUD62qesbsUS7ChLXztEP6LFO76kgJCeI3oFnj1uakUmtC3iCSDDO4DEXiK7vCPM7n0YkJPb9gf7yGc6Z2TEMTi6vCFwRnsiGnp6Jw6K/h81lVzMq4ItwV/+0bvOjHIS+33EOrE2PMmGPWQkS7DBCRFo1cY5Jp27VBkIMQISgY1i6TBYoJExT+djXhpnmkS/rmO7xq8/zmfDy0aTOzmv6OlLHw8vFW7DVLw2SxZSS2K9KKdpmULQ1hajOKw60Roh41/CiIY+aL13qaXHYx6fclYe9b7lGGzGwEeLA/lE82jLQkfbHzkvtvLlz6TmA/GmpBZj7hA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199021)(38070700005)(2906002)(52536014)(8936002)(38100700002)(41300700001)(921005)(122000001)(5660300002)(86362001)(33656002)(55016003)(54906003)(316002)(110136005)(53546011)(71200400001)(7696005)(478600001)(66946007)(66476007)(66446008)(66556008)(76116006)(8676002)(64756008)(4326008)(83380400001)(6506007)(9686003)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFh3WDdrdVNLc3FRN2NRdmMxcmUvTEhXbWxzaitlcW9BVmZFUlZMeXdGVzlr?=
 =?utf-8?B?OFBwRnF0Q1RJWjlLc2paNGZQM0pMQ21FdzluWVZYZmF4UDVpSGRwT1dVTW9w?=
 =?utf-8?B?Ly9sYVppVWYzc3lqVFV0d0QveXBiWm43TWR3L2RLRTQyMElPYWFTS3B0U0Fp?=
 =?utf-8?B?MU5aT054V0NTK1R2bjk5SVM2ek5HVEtybTJnK0d0cGkzajlkZlphQ2tNNlhx?=
 =?utf-8?B?UjRGRzkxMHRTNnNqWUlWMkNmSFo5Njl0Vks5REhUQnFwM3pSZllpaEVIdEl2?=
 =?utf-8?B?clZBeWdLSmcrNU9mZExzM2RNTll2MFppTDYzMmZZalRaYVlMUll0a0Z2Tysw?=
 =?utf-8?B?OXpVL1MrYmtNS0lBUTU4bVdqOUs2VUJlWURuU25yK0VFMTl5QlBreWoyZ3hi?=
 =?utf-8?B?ejNRSjFCaENpbVJ6MGFLV01lRDU1N21nTGNyVFI2aDM3MnNWUnNrdTZjN0JU?=
 =?utf-8?B?djk5VzhBOWhUZkpXVkpNb3RDM3JpZG9CR2UwR2FnTzU0OTFwTER0RkRJN0lL?=
 =?utf-8?B?RFY3eXZwYU1QOVpHdlQ5SCtjSlJLVWtrL2l0SFY2aUcydERnUWdZbkt5VG1x?=
 =?utf-8?B?d1JRYkZkdmJ2N3dpVHcxVldpSzk4UmhSK3BTSnF1VkZWUVRiQW50d21Lbmxx?=
 =?utf-8?B?MWhpVzRoWGsvT0pPUmw4aXhTNSsra2VWd1p1WWd1NmFrSW9WenJwSW9XdW5J?=
 =?utf-8?B?SnA3bFI2dWljUXBsQ0g1TVZnaGVTNFgyazk5cWd6c1c5ZWNQSDA0L3Z4bVU0?=
 =?utf-8?B?WnA3R3FLek9kK1gvVThwZWFNVmFFUFJtaUtJaGFReFUxdFNCTGtPNi9HdmlQ?=
 =?utf-8?B?cUZtRUV1YUVBMUJaT0VMRlhHL0hNOXlJRFV5Rmx1UWRDNEpFN0gzRDEvSGtB?=
 =?utf-8?B?RStiMTdRZlIwcUs4amVZMG11dzFjMmlsb3dPR2F3MHFNMjV0dGdCZTY1VERQ?=
 =?utf-8?B?RGpBaVVMeEwyQmI4Z2R6YUI0Y3FrUWx1RWlabTlsdGM4MGcrMEhGZFdUQk1S?=
 =?utf-8?B?eld1RnZmUWd0Q0pFUjJQUURYd1JzcXVVSjZmaDFiZnREZEQrUjUvUk5GZG5L?=
 =?utf-8?B?dEhuN09QU05lMjhCOXpMMUlaMXVsMGExVVBlN0RDY0QvQ083eHZaanZubG1B?=
 =?utf-8?B?d2ExaDhScm1DTzNBaUt0bDZnQkxSSWNxVml0b1dMQkE5MndySHJjUTlkWDFR?=
 =?utf-8?B?WC9ONnpHeXFBVWxkMlFaUXlDYmMwaEcxMGw4K1c4V2VTT1hRN2lWQjRPeEZZ?=
 =?utf-8?B?d3JnbDNUME15c1NqbVA4UjAzSUkzSnM0UGpoS1FLY3VvQkFlaXN2NldLRFF6?=
 =?utf-8?B?NTZQWHVaVXEydG83TTd2REo0Nk15VUdmcEFOS1RaTW5mZXd3dHR3SUJwOVAy?=
 =?utf-8?B?b2JSLzhkMmtFMHppbjdUVWtCa3NwUkdIRW5HZjFGZnoyYWFvNnRSMG9uM01l?=
 =?utf-8?B?U3JHNkJMOTQ1aU1pdm1vQkxxd2Z5aHh3MlVxVTlrQWhySE01bGxqbXcvWXNT?=
 =?utf-8?B?OE5ORllKc2NaQnd5ODF5TXJGcGNkV3duaWU2czV0dHM3N2xoZGMrSlpOSUht?=
 =?utf-8?B?TUtRNFFMK2ZTN3FXSTFZNDgrMDB6Q3d6d044M0UzSGxpb0ovTlp3WFhWcjVv?=
 =?utf-8?B?cDVkZTZXMUcybElyTWpNWlpGMGZmTWhRbHM0ZFZ1ZDkzVnB5TWFTTkttMWNW?=
 =?utf-8?B?dXdBczVIaEg5VVZBK1o1c3pOS0ZIRkVMWmtCaXJScWphc2E1WmJ2WUppT1NB?=
 =?utf-8?B?VVVLMDVPY1luSG9EcnhzMVJtZUorc096OTR3bExTdC9SVlpGd1VUakVCRmh4?=
 =?utf-8?B?M1FycEt2YjlUZ1ZzVUtUNWVadTdCV2xVSmY5Y2Y2ZncvS3VUSW02ZFg2Qm12?=
 =?utf-8?B?b0N0VVRsVzZVQkJOcTZMQVd5N0dYd1NKRVozV291V29rT3JxWE1wV2N6cGVC?=
 =?utf-8?B?OStzQUlVZXlJbUN4YnhkUVNaOXloS05KR014M24rNmFZb0R1cTBmS2RWZmlX?=
 =?utf-8?B?ZitlNS9MNGRzSXQ0bXBaN3JZajBtdVE2TGpESjFyMWZCdUwwQk9Wc1RWcmxn?=
 =?utf-8?B?M2p1TDdLUVFYU044ajBKMlk2SHhSZjM0bXN1Sk5waTBWYmRsSkdvNjFBWlJN?=
 =?utf-8?B?dzI0NUtwS1A0T3l4Y2NBc3VzTithc1JKWXZwaW1PZjl2MERKVk9IMUlCKzhJ?=
 =?utf-8?Q?uJhF0RwAUzPKvLslTri8Djk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 398028e4-8b99-4664-3be4-08db31386caa
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 16:04:21.3943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /fvXi/4ZAkuQjbMX+ZwvahU19pWBNaRmwyfpa5O+kmND6GXbUnGtSAH/8a0XTt0U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5288
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KSGkgRmVsaXgsDQoNClRoYXQgaXMgY29ycmVjdC4gIFRoZSBkZWJ1Z2dlciB3
aWxsIG5lZWQgc3FfaW50X3ByaXYgdG8gd29yay4NCg0KVGhhbmtzLA0KDQpKb24NCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAzMCwgMjAyMyAxMTozOSBB
TQ0KPiBUbzogVG9tIFJpeCA8dHJpeEByZWRoYXQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+
IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4NCj4gPENocmlz
dGlhbi5Lb2VuaWdAYW1kLmNvbT47IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+Ow0K
PiBhaXJsaWVkQGdtYWlsLmNvbTsgZGFuaWVsQGZmd2xsLmNoOyBuYXRoYW5Aa2VybmVsLm9yZzsN
Cj4gbmRlc2F1bG5pZXJzQGdvb2dsZS5jb207IEtpbSwgSm9uYXRoYW4gPEpvbmF0aGFuLktpbUBh
bWQuY29tPg0KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBs
bHZtQGxpc3RzLmxpbnV4LmRldg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1ka2ZkOiBy
ZW1vdmUgdW51c2VkIHNxX2ludF9wcml2IHZhcmlhYmxlDQo+DQo+IEFtIDIwMjMtMDMtMzAgdW0g
MTE6MjAgc2NocmllYiBUb20gUml4Og0KPiA+IGNsYW5nIHdpdGggVz0xIHJlcG9ydHMNCj4gPiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9hbWRrZmQva2ZkX2ludF9wcm9jZXNzX3YxMS5j
OjI4MjozODoNCj4gZXJyb3I6IHZhcmlhYmxlDQo+ID4gICAgJ3NxX2ludF9wcml2JyBzZXQgYnV0
IG5vdCB1c2VkIFstV2Vycm9yLC1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdDQo+ID4gICAgICAg
ICAgdWludDhfdCBzcV9pbnRfZW5jLCBzcV9pbnRfZXJydHlwZSwgc3FfaW50X3ByaXY7DQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KPiA+IFRoaXMg
dmFyaWFibGUgaXMgbm90IHVzZWQgc28gcmVtb3ZlIGl0Lg0KPg0KPiBIaSBKb24sDQo+DQo+IEkg
dGhpbmsgeW91ciBkZWJ1Z2dlciBwYXRjaGVzIGFyZSBnb2luZyB0byBzdGFydCB1c2luZyB0aGlz
LiBDYW4geW91DQo+IGNvbW1lbnQ/DQo+DQo+IEknZCBwcmVmZXIgbm90IHRvIGFwcGx5IHRoaXMg
cGF0Y2ggbm93LCBhcyBKb24ncyBwYXRjaGVzIGFyZSBleHBlY3RlZCB0bw0KPiBsYW5kIHNvb24s
IG9uY2UgQWxleCBpcyBkb25lIHVwc3RyZWFtaW5nIEdGWCA5LjQuMyBzdXBwb3J0Lg0KPg0KPiBS
ZWdhcmRzLA0KPiAgICBGZWxpeA0KPg0KPg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVG9tIFJp
eCA8dHJpeEByZWRoYXQuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2ludF9wcm9jZXNzX3YxMS5jIHwgOSArLS0tLS0tLS0NCj4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjExLmMNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjExLmMNCj4gPiBp
bmRleCAwZDUzZjYwNjc0MjIuLmJiZDY0NmMwZGVlNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjExLmMNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjExLmMNCj4gPiBAQCAtMjc5
LDcgKzI3OSw3IEBAIHN0YXRpYyB2b2lkIGV2ZW50X2ludGVycnVwdF93cV92MTEoc3RydWN0IGtm
ZF9kZXYNCj4gKmRldiwNCj4gPiAgIHsNCj4gPiAgICAgdWludDE2X3Qgc291cmNlX2lkLCBjbGll
bnRfaWQsIHJpbmdfaWQsIHBhc2lkLCB2bWlkOw0KPiA+ICAgICB1aW50MzJfdCBjb250ZXh0X2lk
MCwgY29udGV4dF9pZDE7DQo+ID4gLSAgIHVpbnQ4X3Qgc3FfaW50X2VuYywgc3FfaW50X2VycnR5
cGUsIHNxX2ludF9wcml2Ow0KPiA+ICsgICB1aW50OF90IHNxX2ludF9lbmMsIHNxX2ludF9lcnJ0
eXBlOw0KPiA+ICAgICBzdHJ1Y3Qga2ZkX3ZtX2ZhdWx0X2luZm8gaW5mbyA9IHswfTsNCj4gPiAg
ICAgc3RydWN0IGtmZF9oc2FfbWVtb3J5X2V4Y2VwdGlvbl9kYXRhIGV4Y2VwdGlvbl9kYXRhOw0K
PiA+DQo+ID4gQEAgLTM0OCwxMyArMzQ4LDYgQEAgc3RhdGljIHZvaWQgZXZlbnRfaW50ZXJydXB0
X3dxX3YxMShzdHJ1Y3Qga2ZkX2Rldg0KPiAqZGV2LA0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsNCj4gPiAgICAgICAgICAgICAgICAgICAgIGNhc2UgU1FfSU5URVJSVVBU
X1dPUkRfRU5DT0RJTkdfSU5TVDoNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJp
bnRfc3FfaW50cl9pbmZvX2luc3QoY29udGV4dF9pZDAsDQo+IGNvbnRleHRfaWQxKTsNCj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3FfaW50X3ByaXYgPSBSRUdfR0VUX0ZJRUxEKGNv
bnRleHRfaWQwLA0KPiA+IC0NCj4gICAgICAgU1FfSU5URVJSVVBUX1dPUkRfV0FWRV9DVFhJRDAs
IFBSSVYpOw0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAvKmlmIChzcV9pbnRfcHJp
diAmJg0KPiAoa2ZkX3NldF9kYmdfZXZfZnJvbV9pbnRlcnJ1cHQoZGV2LCBwYXNpZCwNCj4gPiAt
DQo+ICAgICAgIEtGRF9DVFhJRDBfRE9PUkJFTExfSUQoY29udGV4dF9pZDApLA0KPiA+IC0NCj4g
ICAgICAgS0ZEX0NUWElEMF9UUkFQX0NPREUoY29udGV4dF9pZDApLA0KPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCwgMCkpKQ0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsqLw0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsNCj4gPiAgICAgICAgICAgICAgICAgICAgIGNhc2UgU1FfSU5U
RVJSVVBUX1dPUkRfRU5DT0RJTkdfRVJST1I6DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHByaW50X3NxX2ludHJfaW5mb19lcnJvcihjb250ZXh0X2lkMCwNCj4gY29udGV4dF9pZDEp
Ow0K

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E513838F42
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 14:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E0110E76C;
	Tue, 23 Jan 2024 13:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7671210E76C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 13:04:54 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40NAQkmi018258; Tue, 23 Jan 2024 13:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-type:mime-version; s=
 dk201812; bh=4JJmqrO98xwXxGapTfR4su9sv0Rj24qNM0UEKKaDGw8=; b=XzU
 l5dhExObRhs+5htsRWS49X25jZe2gfBwjbaCRcPqp01igqrRAQvWJamQ2Nnq6HNz
 P1B1tOXkCpu3NwZHmS5d7eo3fms2QDnvnUUMF/4dOhr/SgAbc+INN2p/Tvc1nmv4
 1U7ZS9nsvA4juVnVCW9AiVnGZ2awzUSSj2zRX/MTxUkscgHOWt/ScoW0IJzSrwjW
 Y9t28QV2vZxPS7tv1Qlu6LALULZvmx9xC/qzZ7f7Hom6qI2s739O64s3LDTEGgC7
 /XJIDEbVf6DdrABDX2+qdOdlTVQ+tHZ64Yi3KOxk+U52gNzyqPxJnvYXXLd5qd9J
 ra2ELCMnptPdx4vREiw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3vr5at2bnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Jan 2024 13:04:28 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 13:04:27 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 13:04:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVINLuvtC23iuqliopG8gBtmMNTQ4txtpWZgea//RY8Ss1vs0SybBti1XQrGWswHJj+ppDC4rnwXTNHB8dAXu5Q0AN3tTxyDClLcKGAtJWaNcLVPFX5X0rnSSqDaDo8ql5j7Fp1Y/2TRQAuEamGRYcGxn6HoNR8hu4qD6aWXWKaWRFMmoLOz6RMzhxiiJKftXKagdFwNG5iaNrc+lAxHGaKNhNeSD0H2EmTMD1/BPP6eA58MvWQDt7DRjBbFH5rSuAR4SoEJEATGp1Fbc/kn8diAf1j44clcrDzhHxPHrrf+rXDvZBpIVKQcu2JdQJG4Yf+wEVeE0VQpv0ZzPDv42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JJmqrO98xwXxGapTfR4su9sv0Rj24qNM0UEKKaDGw8=;
 b=YU58obbKZ03qFowOJLeoM7T7xAMk71KoLCx6L+H2u/NEdDDRS8LKVA2cEeSrNPx74MWf1BQt7TBijgsIbN+GrH7oEUrjqveKwjKZUar4hYS9xznUmfCVBHQjrpC6rZ6rIkL+SVQG77n8Y3uvjeMFvwu+/8I+kP+O0Zg2d4O9CijpUX3GxbftkIb0Mz7DZ/cGVM+n5IWStmh4AdXu/qm1m3ElHcaM42z+G+VRtMdMm3VeVulup6Fla0Rwh+iDG48m3fBD31vAr4KUEkCIKA0pXz4mfQPS9dzRun9GNtfIJRepGCx5JlmobKwmeI3juOAqD96LjjcQRvoFdh5FTixozQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JJmqrO98xwXxGapTfR4su9sv0Rj24qNM0UEKKaDGw8=;
 b=ALg6yXLfiooKBuBZXPM50H6psDHh1U1Zs3ihh+JoFm4z2/HMraeeYtiEBhtlQw686tLqK0bdFZw+8usYlQtLNCkgJ7ZFsbpXW5MUA6QR/9bXAI97nW1z/vAHwkV7PKDoY/gtuaYNiPsPZyGTa1bMhqVRzPcC+EaTVoA8IPgvnS8=
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16c::5)
 by LO2P265MB5088.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.36; Tue, 23 Jan
 2024 13:04:24 +0000
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::7238:be9:1fb8:596c]) by LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::7238:be9:1fb8:596c%3]) with mapi id 15.20.7202.028; Tue, 23 Jan 2024
 13:04:24 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH] drm/imagination: On device loss, handle unplug after critical
 section
Thread-Topic: [PATCH] drm/imagination: On device loss, handle unplug after
 critical section
Thread-Index: AQHaTfyvO3XTIeZj0U2UK+bGG2THtg==
Date: Tue, 23 Jan 2024 13:04:24 +0000
Message-ID: <59bb4827-43a5-4e87-8026-77777b2a8087@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB3404:EE_|LO2P265MB5088:EE_
x-ms-office365-filtering-correlation-id: f33f038c-f04e-40fb-235f-08dc1c13d279
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7+JdCpiv9ly0K0VFiI19w9p6nmZGLQgCTjgMdwbdE/hV3kZVIafrwezVvGlsrr8vhDKjpfhHbSwAQSTK43sMRRxv7K6gzeG/7DHfNCdJk7bw4RabvPXBzaigZAAlVWCxXJisE3hK2K267pY5170QeAi+U57OKsjuH7CXcnmUIxYPdzubSEoXP6f04oE5QXqSeR/i3GXGJgcp7GE8APLkw0TBmz2PfkIcHVzaNScAJ1IoCLAYOsiXyKPsC/uqSmWBqItrQ5FM8IgFmev8TRq2yOMbwQr1/yC5FNEKQt5hBBhK1XfCKszDzCm4vgh0ns6T9xaeepWx2eIatapNwF0SSf4XyM5Y7kNqBzxhFPaN42c+DEkyQewJsLKWfe9MBWNRzjsCo0yiLgm2jCU2sC337P+tvc43mh5xQgFunx7iQGEqkRV14dY9err3OO+B9DxGPe3LfXv7AKGcJipqcnDkH/P4IfR7UblvBlTtAdG0qsD683bjA42LARcKJr8k+bjilXEOoCj5lUxnxetsRH/CQyasgY4Oqy7bD3Ixsg1iM9de84YElZnRwrLvdG7Fb7xA2IQNyxoVAb8gzSAhDxockFrnISBKwGVhnf7wF0nKaszufKi1L4K8gvYVgnxIYWDuLLh8B/eHb5hzbu4IoA7b9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39850400004)(136003)(376002)(366004)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(38070700009)(4326008)(83380400001)(8676002)(8936002)(122000001)(38100700002)(99936003)(86362001)(31696002)(41300700001)(36756003)(2906002)(30864003)(5660300002)(76116006)(64756008)(66946007)(66476007)(110136005)(66556008)(316002)(54906003)(66446008)(2616005)(31686004)(6506007)(6486002)(6512007)(966005)(478600001)(71200400001)(26005)(45980500001)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1l5RWpzVG5hNGNaRGFqNFNTdm4zdlROTU9SV1dtSjYvZCtwdFZKYnZJVmxO?=
 =?utf-8?B?eUR4dHRCK0ZJUzRNbVdPNmtQeHhNQXo1OHZodnZjWVhQVGNxUFRuejF3aHJw?=
 =?utf-8?B?QjJaU2I5WXIwYUdwZ1cwQVMrclpOeDNXK2p6RmtrNzRPRGNyeXE2ZDQvREVq?=
 =?utf-8?B?VVh1ckR1VWFpZi8rVUlDTXNtVjZCNGYxVXI5UGVwamViVEM2VnF2Z0pncUJw?=
 =?utf-8?B?N1JPQ3hxa2wvTkNaS1dxeXpldXYwU3BFa01aa2FuZGNCQTk0dkJUVHpUcWZF?=
 =?utf-8?B?bjhsSmtPQ2ZLY3A1MjlPQndua0hrZ1Q2K2h6Y1VpblFaUVNPZUNjWmlyL2Q5?=
 =?utf-8?B?bzgvQ3RhSHIxU0hldHNaeVdGMlhHMzlZWWZtUWFUSkJDeWMrWVQ4dC9iN3Bo?=
 =?utf-8?B?MHk0Q1dyWXBlcVMxcmx5c1FlVmNUUHFxQUtpR2xBUVd5Y0ZMbmFDZHVYc3Rl?=
 =?utf-8?B?U1ltTWs3MXp6UWp4R1BlK3Rtazh3Mk0xQktnQzlYL0VDN0VjTWtaSElOUTE1?=
 =?utf-8?B?Ky92SVpINU9SbWdoSlIwZ2crVVNLQmJRRXREaHRCRER1TGRCblh6c3BVL2V0?=
 =?utf-8?B?c0lBdkV5WjBqZFNaMzZQbGthL1lkQTB6QUdhZWRKS0FrMHFPZHl4YS9KTFRN?=
 =?utf-8?B?ejBZbDRnNCttL2pRQ0JsKzlaMDE2NlNZVCtmQW1xV0dxTTgyVXZaSlBvWEth?=
 =?utf-8?B?eGFaM1dLRFZCUDhHMDg0TTlWa3JLVFpkNStoQk5Ibi9aZTRadGV2RmYvSHhS?=
 =?utf-8?B?ZWRsRnNEMWFQMUtaYUl3dVhDb0tkUFlqRVFqVlFuN09HdW1EeTJvN0JFYVdK?=
 =?utf-8?B?N1BDTGV6MWs3cFpRb0lrRTNxZVJ2R0dZekFJcjJKQUIraG10b1BuMlVJNHN3?=
 =?utf-8?B?ZU1kN2dMckFwekl5dVBndWZVcUNYNXZrbjF3NE5SN3lqSVpaUDQ4RnhDTTNj?=
 =?utf-8?B?RVN2ZzJVTFdXVVVYY2lDVXJvcXZlWG5lb1dSN3oraUYrbmJLd2NUVTBuNGRR?=
 =?utf-8?B?QldIRWd0cGtRcElMdEdxU0ZJQVhkTlRWdytzNmZPMmhWVzJnU3NSZExTRTI4?=
 =?utf-8?B?dVBKaGkrb2FuOGVub1ROa3VRMnVzMzdwa1ZPR2lmOVFDM0J3SENIQWZqUyt3?=
 =?utf-8?B?R0lOREVYSllHT2IydGFCem9WS3BhcDBPQVpXRmdNVW4zREVaODlVYjNjNmdS?=
 =?utf-8?B?MU1YYTFONSswem9MdndweHhpemZjZEorcktoUXBCNmRPMytCOXZuc204NXVy?=
 =?utf-8?B?K3c5bXRpN1BhYnBuR0RDVEJ2cUc5WFY5MjMva25tTVBzcGZTOW9vZUlOcFFD?=
 =?utf-8?B?VFIvdC9rZWhqdmpyRmNsUXZKREtwN3ZiR096WU9CMUlEaXJjT0ZSeGxsNVFW?=
 =?utf-8?B?TDF4Z0Zoc1hxTXpDT1RpSlgwUGlGWk5xa3hiUXpvQW9sMEV1UUV1LzFLZUYw?=
 =?utf-8?B?eVA0SmNKVyt3YjliUERvQVFaQTQwWVpHV3BrSGo5QWZ0RXg0RXMwVWdVNWdL?=
 =?utf-8?B?dGZPa080VDAwMG9aakpRYlNWbzRDK2dUS25CV0ZUUUJxTEhmKy9xQ29PZ3c0?=
 =?utf-8?B?WkNFdlVRdVlKTDlkSVJLTzdseDN5QWxIaUZOTU90L2dDeFlyVHlQV29Ldkgy?=
 =?utf-8?B?Tkw5UkFaNFYvSkszWnVxb0ZVR3hIakozSlI1ejI1K3ZWMnBDanZ3dTM3M2hG?=
 =?utf-8?B?YXBSUHIxc1dUYi9ycFg2Z1kyczExaWpoV2hqRFg2bk1uQlg3eENBSnlxRnZV?=
 =?utf-8?B?RnZOcWNXRFhLM2xRUTBMdVlNUEg0a1g2WVl5MUlaV2RsZHZzN01USk9FVW9y?=
 =?utf-8?B?R2l6aDFCYURBVVVZcDljUUhVQlUveEN5Wmc3c2F3Z2E1dkFVOGlUTnFLbDNv?=
 =?utf-8?B?cGhaUC9BOWNYakVRQkpROVJuRDc2VFphTC91YTN3ZkRmeG93YU1RN1dML2Js?=
 =?utf-8?B?YktvSStyT0VsUCtHZStsMWRsZjY1Rk5VdmEwRE94c3Z1b0lpelpiWk5UcDJ1?=
 =?utf-8?B?ZEZXM1NhY2lZSE5NdGcxMnB5a3NnenRzTm5IVWMya1J5V2tUVERQby9WNkJV?=
 =?utf-8?B?RkFDTUI4SGRVbjdwZGNwSHAwZ0tuWW5RZjF3MEdoZ1ZpaTJ6QTQ4L1pKd01T?=
 =?utf-8?B?cHF2UG9OZHVsUkNEeXYrQXZsQ0wrWkcvSFpZUkJIaDNYa21DUEZxMUJ3RC9O?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bJW5jYP9mXUmPcTic0vJso7G"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f33f038c-f04e-40fb-235f-08dc1c13d279
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 13:04:24.0458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3DbZsfTibXM6loHMRb7f9J+PWjTNovSA5bxvOvFpZEeFtPD11bcIplj8d+8yotUFBDkCbrUPwx0xs7G+brKCeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5088
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: fHJKybeNfXiO8Z8TPcVawM-3CaBAW4AW
X-Proofpoint-GUID: fHJKybeNfXiO8Z8TPcVawM-3CaBAW4AW
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------bJW5jYP9mXUmPcTic0vJso7G
Content-Type: multipart/mixed; boundary="------------Mwfg5074Lu5GyRsxkP9P152I";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <59bb4827-43a5-4e87-8026-77777b2a8087@imgtec.com>
Subject: [PATCH] drm/imagination: On device loss, handle unplug after critical
 section

--------------Mwfg5074Lu5GyRsxkP9P152I
Content-Type: multipart/mixed; boundary="------------7I5MbiBmF0aagSQ0mmlq7wcJ"

--------------7I5MbiBmF0aagSQ0mmlq7wcJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Donald Robson <donald.robson@imgtec.com>

When the kernel driver 'loses' the device, for instance if the firmware
stops communicating, the driver calls drm_dev_unplug(). This is
currently done inside the drm_dev_enter() critical section, which isn't
permitted. In addition, the bool that marks the device as lost is not
atomic or protected by a lock.

This fix replaces the bool with an atomic that also acts as a mechanism
to ensure the device is unplugged after drm_dev_exit(), preventing a
concurrent call to drm_dev_enter() from succeeding in a race between it
and drm_dev_unplug().

Reported-by: Steven Price <steven.price@arm.com>
Closes: https://lore.kernel.org/dri-devel/1b957ca4-71cf-42fd-ac81-1920592=
b952d@arm.com/
Fixes: cc1aeedb98ad ("drm/imagination: Implement firmware infrastructure =
and META FW support")
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_ccb.c      |  2 +-
 drivers/gpu/drm/imagination/pvr_device.c   | 98 +++++++++++++++++++++-
 drivers/gpu/drm/imagination/pvr_device.h   | 72 +++++++++++++---
 drivers/gpu/drm/imagination/pvr_drv.c      | 87 ++++++++++---------
 drivers/gpu/drm/imagination/pvr_fw.c       | 12 +--
 drivers/gpu/drm/imagination/pvr_fw_trace.c |  4 +-
 drivers/gpu/drm/imagination/pvr_mmu.c      | 20 ++---
 drivers/gpu/drm/imagination/pvr_power.c    | 42 +++-------
 drivers/gpu/drm/imagination/pvr_power.h    |  2 -
 9 files changed, 237 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imag=
ination/pvr_ccb.c
index 4deeac7ed40a..1fe64adc0c2c 100644
--- a/drivers/gpu/drm/imagination/pvr_ccb.c
+++ b/drivers/gpu/drm/imagination/pvr_ccb.c
@@ -247,7 +247,7 @@ pvr_kccb_send_cmd_reserved_powered(struct pvr_device =
*pvr_dev,
 	u32 old_write_offset;
 	u32 new_write_offset;
=20
-	WARN_ON(pvr_dev->lost);
+	WARN_ON(pvr_device_is_lost(pvr_dev));
=20
 	mutex_lock(&pvr_ccb->lock);
=20
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/i=
magination/pvr_device.c
index 1704c0268589..397491375b7d 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -6,14 +6,15 @@
=20
 #include "pvr_fw.h"
 #include "pvr_params.h"
-#include "pvr_power.h"
 #include "pvr_queue.h"
 #include "pvr_rogue_cr_defs.h"
 #include "pvr_stream.h"
 #include "pvr_vm.h"
=20
+#include <drm/drm_drv.h>
 #include <drm/drm_print.h>
=20
+#include <linux/atomic.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/compiler_attributes.h>
@@ -556,6 +557,101 @@ pvr_device_fini(struct pvr_device *pvr_dev)
 	pvr_device_gpu_fini(pvr_dev);
 }
=20
+/**
+ * pvr_device_enter() - Try to enter device critical section.
+ * @pvr_dev: Target PowerVR device.
+ * @idx: Pointer to index that will be passed to the matching pvr_device=
_exit().
+ *
+ * Use this in place of drm_dev_enter() within this driver.
+ *
+ * Returns:
+ *  * %true if the critical section was entered, or
+ *  * %false otherwise.
+ */
+bool pvr_device_enter(struct pvr_device *pvr_dev, int *idx)
+{
+	const enum pvr_device_state old_state =3D
+		atomic_cmpxchg(&pvr_dev->state,
+			       PVR_DEVICE_STATE_PRESENT,
+			       PVR_DEVICE_STATE_ENTERED);
+
+	switch (old_state) {
+	case PVR_DEVICE_STATE_PRESENT:
+	case PVR_DEVICE_STATE_ENTERED:
+		return drm_dev_enter(from_pvr_device(pvr_dev), idx);
+
+	case PVR_DEVICE_STATE_LOST:
+	case PVR_DEVICE_STATE_LOST_UNPLUGGED:
+		WARN_ONCE(1, "Attempt to use GPU after becoming lost.");
+		break;
+	}
+
+	return false;
+}
+
+/**
+ * pvr_device_exit() - Exit a device critical section.
+ * @pvr_dev: Target PowerVR device.
+ * @idx: Index given by matching pvr_device_enter().
+ *
+ * Use this in place of drm_dev_exit() within this driver.
+ */
+void pvr_device_exit(struct pvr_device *pvr_dev, int idx)
+{
+	const enum pvr_device_state old_state =3D
+		atomic_cmpxchg(&pvr_dev->state,
+			       PVR_DEVICE_STATE_ENTERED,
+			       PVR_DEVICE_STATE_PRESENT);
+
+	switch (old_state) {
+	case PVR_DEVICE_STATE_PRESENT:
+	case PVR_DEVICE_STATE_ENTERED:
+		drm_dev_exit(idx);
+		return;
+
+	case PVR_DEVICE_STATE_LOST:
+		/* Unplug the device if it was lost during the critical section. */
+		atomic_set(&pvr_dev->state, PVR_DEVICE_STATE_LOST_UNPLUGGED);
+
+		drm_dev_exit(idx);
+
+		WARN_ONCE(1, "GPU lost and now unplugged.");
+		drm_dev_unplug(from_pvr_device(pvr_dev));
+
+		return;
+
+	case PVR_DEVICE_STATE_LOST_UNPLUGGED:
+		WARN_ONCE(1, "GPU unplugged during critical section.");
+		drm_dev_exit(idx);
+		return;
+	}
+}
+
+/**
+ * pvr_device_set_lost() - Mark GPU device as lost.
+ * @pvr_dev: Target PowerVR device.
+ *
+ * This will cause the DRM device to be unplugged at the next call to
+ * pvr_device_exit().
+ */
+void pvr_device_set_lost(struct pvr_device *pvr_dev)
+{
+	/*
+	 * Unplug the device immediately if the device is not in a critical
+	 * section.
+	 */
+	const bool unplug =3D atomic_cmpxchg(&pvr_dev->state,
+					   PVR_DEVICE_STATE_PRESENT,
+					   PVR_DEVICE_STATE_LOST_UNPLUGGED) =3D=3D
+			    PVR_DEVICE_STATE_PRESENT;
+
+	if (unplug)
+		drm_dev_unplug(from_pvr_device(pvr_dev));
+	else
+		atomic_cmpxchg(&pvr_dev->state, PVR_DEVICE_STATE_ENTERED,
+			       PVR_DEVICE_STATE_LOST);
+}
+
 bool
 pvr_device_has_uapi_quirk(struct pvr_device *pvr_dev, u32 quirk)
 {
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/i=
magination/pvr_device.h
index ecdd5767d8ef..7c08b2bda395 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -274,20 +274,19 @@ struct pvr_device {
 	} kccb;
=20
 	/**
-	 * @lost: %true if the device has been lost.
-	 *
-	 * This variable is set if the device has become irretrievably unavaila=
ble, e.g. if the
-	 * firmware processor has stopped responding and can not be revived via=
 a hard reset.
+	 * @state: Indicates whether the device is present and in use. One of
+	 * &enum pvr_device_state.
 	 */
-	bool lost;
+	atomic_t state;
=20
 	/**
 	 * @reset_sem: Reset semaphore.
 	 *
-	 * GPU reset code will lock this for writing. Any code that submits com=
mands to the firmware
-	 * that isn't in an IRQ handler or on the scheduler workqueue must lock=
 this for reading.
-	 * Once this has been successfully locked, &pvr_dev->lost _must_ be che=
cked, and -%EIO must
-	 * be returned if it is set.
+	 * GPU reset code will lock this for writing. Any code that submits
+	 * commands to the firmware that isn't in an IRQ handler or on the
+	 * scheduler workqueue must lock this for reading.
+	 * Once this has been successfully locked, pvr_device_is_lost() _must_
+	 * be checked, and -%EIO must be returned if it is.
 	 */
 	struct rw_semaphore reset_sem;
=20
@@ -487,7 +486,60 @@ packed_bvnc_to_pvr_gpu_id(u64 bvnc, struct pvr_gpu_i=
d *gpu_id)
=20
 int pvr_device_init(struct pvr_device *pvr_dev);
 void pvr_device_fini(struct pvr_device *pvr_dev);
-void pvr_device_reset(struct pvr_device *pvr_dev);
+
+/**
+ * enum pvr_device_state - States used by &struct pvr_device.state.
+ */
+enum pvr_device_state {
+	/** @PVR_DEVICE_STATE_PRESENT: The device is available for use. */
+	PVR_DEVICE_STATE_PRESENT,
+
+	/** @PVR_DEVICE_STATE_ENTERED: The device is in a critical section. */
+	PVR_DEVICE_STATE_ENTERED,
+
+	/**
+	 * @PVR_DEVICE_STATE_LOST: The device was lost during the current devic=
e
+	 * critical section and will be unplugged once the section exits.
+	 */
+	PVR_DEVICE_STATE_LOST,
+
+	/**
+	 * @PVR_DEVICE_STATE_LOST_UNPLUGGED: The device was lost and
+	 * subsequently unplugged.
+	 *
+	 * The device may become irretrievably unavailable, e.g. if the firmwar=
e
+	 * processor has stopped responding and can not be revived via a hard
+	 * reset.
+	 */
+	PVR_DEVICE_STATE_LOST_UNPLUGGED,
+};
+
+/**
+ * pvr_device_is_lost() - Check if GPU device has been marked lost.
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * %true if device is lost, or
+ *  * %false otherwise.
+ */
+static __always_inline bool pvr_device_is_lost(struct pvr_device *pvr_de=
v)
+{
+	switch ((enum pvr_device_state)atomic_read(&pvr_dev->state)) {
+	case PVR_DEVICE_STATE_PRESENT:
+	case PVR_DEVICE_STATE_ENTERED:
+		return false;
+
+	case PVR_DEVICE_STATE_LOST:
+	case PVR_DEVICE_STATE_LOST_UNPLUGGED:
+		break;
+	}
+
+	return true;
+}
+
+bool pvr_device_enter(struct pvr_device *pvr_dev, int *idx);
+void pvr_device_exit(struct pvr_device *pvr_dev, int idx);
+void pvr_device_set_lost(struct pvr_device *pvr_dev);
=20
 bool
 pvr_device_has_uapi_quirk(struct pvr_device *pvr_dev, u32 quirk);
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imag=
ination/pvr_drv.c
index 5c3b2d58d766..55bea656a40f 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -81,13 +81,13 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, void =
*raw_args,
 	int idx;
 	int err;
=20
-	if (!drm_dev_enter(drm_dev, &idx))
+	if (!pvr_device_enter(pvr_dev, &idx))
 		return -EIO;
=20
 	/* All padding fields must be zeroed. */
 	if (args->_padding_c !=3D 0) {
 		err =3D -EINVAL;
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
 	}
=20
 	/*
@@ -101,7 +101,7 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, void =
*raw_args,
 	if (args->size > SIZE_MAX || args->size =3D=3D 0 || args->flags &
 	    ~DRM_PVR_BO_FLAGS_MASK || args->size & (PVR_DEVICE_PAGE_SIZE - 1)) =
{
 		err =3D -EINVAL;
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
 	}
=20
 	sanitized_size =3D (size_t)args->size;
@@ -113,7 +113,7 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, void =
*raw_args,
 	pvr_obj =3D pvr_gem_object_create(pvr_dev, sanitized_size, args->flags)=
;
 	if (IS_ERR(pvr_obj)) {
 		err =3D PTR_ERR(pvr_obj);
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
 	}
=20
 	/* This function will not modify &args->handle unless it succeeds. */
@@ -121,7 +121,7 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, void =
*raw_args,
 	if (err)
 		goto err_destroy_obj;
=20
-	drm_dev_exit(idx);
+	pvr_device_exit(pvr_dev, idx);
=20
 	return 0;
=20
@@ -133,8 +133,8 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, void =
*raw_args,
 	 */
 	pvr_gem_object_put(pvr_obj);
=20
-err_drm_dev_exit:
-	drm_dev_exit(idx);
+err_pvr_device_exit:
+	pvr_device_exit(pvr_dev, idx);
=20
 	return err;
 }
@@ -164,19 +164,20 @@ pvr_ioctl_get_bo_mmap_offset(struct drm_device *drm=
_dev, void *raw_args,
 			     struct drm_file *file)
 {
 	struct drm_pvr_ioctl_get_bo_mmap_offset_args *args =3D raw_args;
+	struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
 	struct pvr_file *pvr_file =3D to_pvr_file(file);
 	struct pvr_gem_object *pvr_obj;
 	struct drm_gem_object *gem_obj;
 	int idx;
 	int ret;
=20
-	if (!drm_dev_enter(drm_dev, &idx))
+	if (!pvr_device_enter(pvr_dev, &idx))
 		return -EIO;
=20
 	/* All padding fields must be zeroed. */
 	if (args->_padding_4 !=3D 0) {
 		ret =3D -EINVAL;
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
 	}
=20
 	/*
@@ -188,7 +189,7 @@ pvr_ioctl_get_bo_mmap_offset(struct drm_device *drm_d=
ev, void *raw_args,
 	pvr_obj =3D pvr_gem_object_from_handle(pvr_file, args->handle);
 	if (!pvr_obj) {
 		ret =3D -ENOENT;
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
 	}
=20
 	gem_obj =3D gem_from_pvr_gem(pvr_obj);
@@ -202,7 +203,7 @@ pvr_ioctl_get_bo_mmap_offset(struct drm_device *drm_d=
ev, void *raw_args,
 	if (ret !=3D 0) {
 		/* Drop our reference to the buffer object. */
 		drm_gem_object_put(gem_obj);
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
 	}
=20
 	/*
@@ -214,8 +215,8 @@ pvr_ioctl_get_bo_mmap_offset(struct drm_device *drm_d=
ev, void *raw_args,
 	/* Drop our reference to the buffer object. */
 	pvr_gem_object_put(pvr_obj);
=20
-err_drm_dev_exit:
-	drm_dev_exit(idx);
+err_pvr_device_exit:
+	pvr_device_exit(pvr_dev, idx);
=20
 	return ret;
 }
@@ -626,7 +627,7 @@ pvr_ioctl_dev_query(struct drm_device *drm_dev, void =
*raw_args,
 	int idx;
 	int ret =3D -EINVAL;
=20
-	if (!drm_dev_enter(drm_dev, &idx))
+	if (!pvr_device_enter(pvr_dev, &idx))
 		return -EIO;
=20
 	switch ((enum drm_pvr_dev_query)args->type) {
@@ -655,7 +656,7 @@ pvr_ioctl_dev_query(struct drm_device *drm_dev, void =
*raw_args,
 		break;
 	}
=20
-	drm_dev_exit(idx);
+	pvr_device_exit(pvr_dev, idx);
=20
 	return ret;
 }
@@ -680,16 +681,17 @@ pvr_ioctl_create_context(struct drm_device *drm_dev=
, void *raw_args,
 			 struct drm_file *file)
 {
 	struct drm_pvr_ioctl_create_context_args *args =3D raw_args;
+	struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
 	struct pvr_file *pvr_file =3D file->driver_priv;
 	int idx;
 	int ret;
=20
-	if (!drm_dev_enter(drm_dev, &idx))
+	if (!pvr_device_enter(pvr_dev, &idx))
 		return -EIO;
=20
 	ret =3D pvr_context_create(pvr_file, args);
=20
-	drm_dev_exit(idx);
+	pvr_device_exit(pvr_dev, idx);
=20
 	return ret;
 }
@@ -738,18 +740,19 @@ pvr_ioctl_create_free_list(struct drm_device *drm_d=
ev, void *raw_args,
 			   struct drm_file *file)
 {
 	struct drm_pvr_ioctl_create_free_list_args *args =3D raw_args;
+	struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
 	struct pvr_file *pvr_file =3D to_pvr_file(file);
 	struct pvr_free_list *free_list;
 	int idx;
 	int err;
=20
-	if (!drm_dev_enter(drm_dev, &idx))
+	if (!pvr_device_enter(pvr_dev, &idx))
 		return -EIO;
=20
 	free_list =3D pvr_free_list_create(pvr_file, args);
 	if (IS_ERR(free_list)) {
 		err =3D PTR_ERR(free_list);
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
 	}
=20
 	/* Allocate object handle for userspace. */
@@ -761,15 +764,15 @@ pvr_ioctl_create_free_list(struct drm_device *drm_d=
ev, void *raw_args,
 	if (err < 0)
 		goto err_cleanup;
=20
-	drm_dev_exit(idx);
+	pvr_device_exit(pvr_dev, idx);
=20
 	return 0;
=20
 err_cleanup:
 	pvr_free_list_put(free_list);
=20
-err_drm_dev_exit:
-	drm_dev_exit(idx);
+err_pvr_device_exit:
+	pvr_device_exit(pvr_dev, idx);
=20
 	return err;
 }
@@ -824,18 +827,19 @@ pvr_ioctl_create_hwrt_dataset(struct drm_device *dr=
m_dev, void *raw_args,
 			      struct drm_file *file)
 {
 	struct drm_pvr_ioctl_create_hwrt_dataset_args *args =3D raw_args;
+	struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
 	struct pvr_file *pvr_file =3D to_pvr_file(file);
 	struct pvr_hwrt_dataset *hwrt;
 	int idx;
 	int err;
=20
-	if (!drm_dev_enter(drm_dev, &idx))
+	if (!pvr_device_enter(pvr_dev, &idx))
 		return -EIO;
=20
 	hwrt =3D pvr_hwrt_dataset_create(pvr_file, args);
 	if (IS_ERR(hwrt)) {
 		err =3D PTR_ERR(hwrt);
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
 	}
=20
 	/* Allocate object handle for userspace. */
@@ -847,15 +851,15 @@ pvr_ioctl_create_hwrt_dataset(struct drm_device *dr=
m_dev, void *raw_args,
 	if (err < 0)
 		goto err_cleanup;
=20
-	drm_dev_exit(idx);
+	pvr_device_exit(pvr_dev, idx);
=20
 	return 0;
=20
 err_cleanup:
 	pvr_hwrt_dataset_put(hwrt);
=20
-err_drm_dev_exit:
-	drm_dev_exit(idx);
+err_pvr_device_exit:
+	pvr_device_exit(pvr_dev, idx);
=20
 	return err;
 }
@@ -910,23 +914,24 @@ pvr_ioctl_create_vm_context(struct drm_device *drm_=
dev, void *raw_args,
 			    struct drm_file *file)
 {
 	struct drm_pvr_ioctl_create_vm_context_args *args =3D raw_args;
+	struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
 	struct pvr_file *pvr_file =3D to_pvr_file(file);
 	struct pvr_vm_context *vm_ctx;
 	int idx;
 	int err;
=20
-	if (!drm_dev_enter(drm_dev, &idx))
+	if (!pvr_device_enter(pvr_dev, &idx))
 		return -EIO;
=20
 	if (args->_padding_4) {
 		err =3D -EINVAL;
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
 	}
=20
 	vm_ctx =3D pvr_vm_create_context(pvr_file->pvr_dev, true);
 	if (IS_ERR(vm_ctx)) {
 		err =3D PTR_ERR(vm_ctx);
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
 	}
=20
 	/* Allocate object handle for userspace. */
@@ -938,15 +943,15 @@ pvr_ioctl_create_vm_context(struct drm_device *drm_=
dev, void *raw_args,
 	if (err < 0)
 		goto err_cleanup;
=20
-	drm_dev_exit(idx);
+	pvr_device_exit(pvr_dev, idx);
=20
 	return 0;
=20
 err_cleanup:
 	pvr_vm_context_put(vm_ctx);
=20
-err_drm_dev_exit:
-	drm_dev_exit(idx);
+err_pvr_device_exit:
+	pvr_device_exit(pvr_dev, idx);
=20
 	return err;
 }
@@ -1022,26 +1027,26 @@ pvr_ioctl_vm_map(struct drm_device *drm_dev, void=
 *raw_args,
 	int idx;
 	int err;
=20
-	if (!drm_dev_enter(drm_dev, &idx))
+	if (!pvr_device_enter(pvr_dev, &idx))
 		return -EIO;
=20
 	/* Initial validation of args. */
 	if (args->_padding_14) {
 		err =3D -EINVAL;
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
 	}
=20
 	if (args->flags !=3D 0 ||
 	    check_add_overflow(args->offset, args->size, &offset_plus_size) ||
 	    !pvr_find_heap_containing(pvr_dev, args->device_addr, args->size)) =
{
 		err =3D -EINVAL;
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
 	}
=20
 	vm_ctx =3D pvr_vm_context_lookup(pvr_file, args->vm_context_handle);
 	if (!vm_ctx) {
 		err =3D -EINVAL;
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
 	}
=20
 	pvr_obj =3D pvr_gem_object_from_handle(pvr_file, args->handle);
@@ -1079,8 +1084,8 @@ pvr_ioctl_vm_map(struct drm_device *drm_dev, void *=
raw_args,
 err_put_vm_context:
 	pvr_vm_context_put(vm_ctx);
=20
-err_drm_dev_exit:
-	drm_dev_exit(idx);
+err_pvr_device_exit:
+	pvr_device_exit(pvr_dev, idx);
=20
 	return err;
 }
@@ -1148,12 +1153,12 @@ pvr_ioctl_submit_jobs(struct drm_device *drm_dev,=
 void *raw_args,
 	int idx;
 	int err;
=20
-	if (!drm_dev_enter(drm_dev, &idx))
+	if (!pvr_device_enter(pvr_dev, &idx))
 		return -EIO;
=20
 	err =3D pvr_submit_jobs(pvr_dev, pvr_file, args);
=20
-	drm_dev_exit(idx);
+	pvr_device_exit(pvr_dev, idx);
=20
 	return err;
 }
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagi=
nation/pvr_fw.c
index 3debc9870a82..07547e167963 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -1094,7 +1094,7 @@ pvr_fw_structure_cleanup(struct pvr_device *pvr_dev=
, u32 type, struct pvr_fw_obj
=20
 	down_read(&pvr_dev->reset_sem);
=20
-	if (!drm_dev_enter(from_pvr_device(pvr_dev), &idx)) {
+	if (!pvr_device_enter(pvr_dev, &idx)) {
 		err =3D -EIO;
 		goto err_up_read;
 	}
@@ -1118,22 +1118,22 @@ pvr_fw_structure_cleanup(struct pvr_device *pvr_d=
ev, u32 type, struct pvr_fw_obj
 		break;
 	default:
 		err =3D -EINVAL;
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
 	}
=20
 	err =3D pvr_kccb_send_cmd(pvr_dev, &cmd, &slot_nr);
 	if (err)
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
=20
 	err =3D pvr_kccb_wait_for_completion(pvr_dev, slot_nr, HZ, &rtn);
 	if (err)
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
=20
 	if (rtn & ROGUE_FWIF_KCCB_RTN_SLOT_CLEANUP_BUSY)
 		err =3D -EBUSY;
=20
-err_drm_dev_exit:
-	drm_dev_exit(idx);
+err_pvr_device_exit:
+	pvr_device_exit(pvr_dev, idx);
=20
 err_up_read:
 	up_read(&pvr_dev->reset_sem);
diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm=
/imagination/pvr_fw_trace.c
index 31199e45b72e..26d67483eac2 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -149,7 +149,7 @@ update_logtype(struct pvr_device *pvr_dev, u32 group_=
mask)
 	fw_trace->group_mask =3D group_mask;
=20
 	down_read(&pvr_dev->reset_sem);
-	if (!drm_dev_enter(from_pvr_device(pvr_dev), &idx)) {
+	if (!pvr_device_enter(pvr_dev, &idx)) {
 		err =3D -EIO;
 		goto err_up_read;
 	}
@@ -159,7 +159,7 @@ update_logtype(struct pvr_device *pvr_dev, u32 group_=
mask)
=20
 	err =3D pvr_kccb_send_cmd(pvr_dev, &cmd, NULL);
=20
-	drm_dev_exit(idx);
+	pvr_device_exit(pvr_dev, idx);
=20
 err_up_read:
 	up_read(&pvr_dev->reset_sem);
diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imag=
ination/pvr_mmu.c
index 4fe70610ed94..59911f70e9ca 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.c
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -129,18 +129,18 @@ int pvr_mmu_flush_exec(struct pvr_device *pvr_dev, =
bool wait)
 	u32 slot;
 	int idx;
=20
-	if (!drm_dev_enter(from_pvr_device(pvr_dev), &idx))
+	if (!pvr_device_enter(pvr_dev, &idx))
 		return -EIO;
=20
 	/* Can't flush MMU if the firmware hasn't booted yet. */
 	if (!pvr_dev->fw_dev.booted)
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
=20
 	cmd_mmu_cache_data->cache_flags =3D
 		atomic_xchg(&pvr_dev->mmu_flush_cache_flags, 0);
=20
 	if (!cmd_mmu_cache_data->cache_flags)
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
=20
 	cmd_mmu_cache.cmd_type =3D ROGUE_FWIF_KCCB_CMD_MMUCACHE;
=20
@@ -156,7 +156,7 @@ int pvr_mmu_flush_exec(struct pvr_device *pvr_dev, bo=
ol wait)
 	if (err)
 		goto err_reset_and_retry;
=20
-	drm_dev_exit(idx);
+	pvr_device_exit(pvr_dev, idx);
=20
 	return 0;
=20
@@ -167,23 +167,23 @@ int pvr_mmu_flush_exec(struct pvr_device *pvr_dev, =
bool wait)
 	 */
 	err =3D pvr_power_reset(pvr_dev, true);
 	if (err)
-		goto err_drm_dev_exit; /* Device is lost. */
+		goto err_pvr_device_exit; /* Device is lost. */
=20
 	/* Retry sending flush request. */
 	err =3D pvr_kccb_send_cmd(pvr_dev, &cmd_mmu_cache, &slot);
 	if (err) {
-		pvr_device_lost(pvr_dev);
-		goto err_drm_dev_exit;
+		pvr_device_set_lost(pvr_dev);
+		goto err_pvr_device_exit;
 	}
=20
 	if (wait) {
 		err =3D pvr_kccb_wait_for_completion(pvr_dev, slot, HZ, NULL);
 		if (err)
-			pvr_device_lost(pvr_dev);
+			pvr_device_set_lost(pvr_dev);
 	}
=20
-err_drm_dev_exit:
-	drm_dev_exit(idx);
+err_pvr_device_exit:
+	pvr_device_exit(pvr_dev, idx);
=20
 	return err;
 }
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/im=
agination/pvr_power.c
index ba7816fd28ec..c927def3d3f3 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -23,21 +23,6 @@
=20
 #define WATCHDOG_TIME_MS (500)
=20
-/**
- * pvr_device_lost() - Mark GPU device as lost
- * @pvr_dev: Target PowerVR device.
- *
- * This will cause the DRM device to be unplugged.
- */
-void
-pvr_device_lost(struct pvr_device *pvr_dev)
-{
-	if (!pvr_dev->lost) {
-		pvr_dev->lost =3D true;
-		drm_dev_unplug(from_pvr_device(pvr_dev));
-	}
-}
-
 static int
 pvr_power_send_command(struct pvr_device *pvr_dev, struct rogue_fwif_kcc=
b_cmd *pow_cmd)
 {
@@ -186,7 +171,7 @@ pvr_watchdog_worker(struct work_struct *work)
 						  watchdog.work.work);
 	bool stalled;
=20
-	if (pvr_dev->lost)
+	if (pvr_device_is_lost(pvr_dev))
 		return;
=20
 	if (pm_runtime_get_if_in_use(from_pvr_device(pvr_dev)->dev) <=3D 0)
@@ -208,10 +193,9 @@ pvr_watchdog_worker(struct work_struct *work)
 	pm_runtime_put(from_pvr_device(pvr_dev)->dev);
=20
 out_requeue:
-	if (!pvr_dev->lost) {
+	if (!pvr_device_is_lost(pvr_dev))
 		queue_delayed_work(pvr_dev->sched_wq, &pvr_dev->watchdog.work,
 				   msecs_to_jiffies(WATCHDOG_TIME_MS));
-	}
 }
=20
 /**
@@ -239,21 +223,21 @@ pvr_power_device_suspend(struct device *dev)
 	int err =3D 0;
 	int idx;
=20
-	if (!drm_dev_enter(drm_dev, &idx))
+	if (!pvr_device_enter(pvr_dev, &idx))
 		return -EIO;
=20
 	if (pvr_dev->fw_dev.booted) {
 		err =3D pvr_power_fw_disable(pvr_dev, false);
 		if (err)
-			goto err_drm_dev_exit;
+			goto err_pvr_device_exit;
 	}
=20
 	clk_disable_unprepare(pvr_dev->mem_clk);
 	clk_disable_unprepare(pvr_dev->sys_clk);
 	clk_disable_unprepare(pvr_dev->core_clk);
=20
-err_drm_dev_exit:
-	drm_dev_exit(idx);
+err_pvr_device_exit:
+	pvr_device_exit(pvr_dev, idx);
=20
 	return err;
 }
@@ -267,12 +251,12 @@ pvr_power_device_resume(struct device *dev)
 	int idx;
 	int err;
=20
-	if (!drm_dev_enter(drm_dev, &idx))
+	if (!pvr_device_enter(pvr_dev, &idx))
 		return -EIO;
=20
 	err =3D clk_prepare_enable(pvr_dev->core_clk);
 	if (err)
-		goto err_drm_dev_exit;
+		goto err_pvr_device_exit;
=20
 	err =3D clk_prepare_enable(pvr_dev->sys_clk);
 	if (err)
@@ -288,7 +272,7 @@ pvr_power_device_resume(struct device *dev)
 			goto err_mem_clk_disable;
 	}
=20
-	drm_dev_exit(idx);
+	pvr_device_exit(pvr_dev, idx);
=20
 	return 0;
=20
@@ -301,8 +285,8 @@ pvr_power_device_resume(struct device *dev)
 err_core_clk_disable:
 	clk_disable_unprepare(pvr_dev->core_clk);
=20
-err_drm_dev_exit:
-	drm_dev_exit(idx);
+err_pvr_device_exit:
+	pvr_device_exit(pvr_dev, idx);
=20
 	return err;
 }
@@ -345,7 +329,7 @@ pvr_power_reset(struct pvr_device *pvr_dev, bool hard=
_reset)
=20
 	down_write(&pvr_dev->reset_sem);
=20
-	if (pvr_dev->lost) {
+	if (pvr_device_is_lost(pvr_dev)) {
 		err =3D -EIO;
 		goto err_up_write;
 	}
@@ -407,7 +391,7 @@ pvr_power_reset(struct pvr_device *pvr_dev, bool hard=
_reset)
=20
 err_device_lost:
 	drm_err(from_pvr_device(pvr_dev), "GPU device lost");
-	pvr_device_lost(pvr_dev);
+	pvr_device_set_lost(pvr_dev);
=20
 	/* Leave IRQs disabled if the device is lost. */
=20
diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm/im=
agination/pvr_power.h
index 9a9312dcb2da..360980f454d7 100644
--- a/drivers/gpu/drm/imagination/pvr_power.h
+++ b/drivers/gpu/drm/imagination/pvr_power.h
@@ -12,8 +12,6 @@
 int pvr_watchdog_init(struct pvr_device *pvr_dev);

--------------7I5MbiBmF0aagSQ0mmlq7wcJ
Content-Type: application/pgp-keys; name="OpenPGP_0x747F0A9036F90DFA.asc"
Content-Disposition: attachment; filename="OpenPGP_0x747F0A9036F90DFA.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLb
kxJDF5DNJE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMW
CAA+AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8K
kDb5DfoFAmRHxyEFCQWsiK8ACgkQdH8KkDb5Dfr3+QEApzVEKHrbpxJqs79GRaXU
/NAQBxzjwBd4wKxqr5gkUxYBAOuK7Ag2dAZzFUp73tKxIN9uyMdCLRXWvAYqYL7l
uRIIwpYEExYIAD4WIQQFpAz85yadYdlxAKF0fwqQNvkN+gUCYl2lcgIbAwUJAeEz
gAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRB0fwqQNvkN+uO8AQDM69Bb0Wqj
7kyzEejIZa9/93vdzHcDmuiQxxvXEUqQ3QEA9qBYj3PBnWD1Ijhj9bm/Z6S93d1x
w97TbUrxgwJYtgrOOARiXaVyEgorBgEEAZdVAQUBAQdAJpULxfns06/aM1t5eqM/
16RjuvPLtq6IRnk/FoNZRBUDAQgHwn4EGBYIACYCGwwWIQQFpAz85yadYdlxAKF0
fwqQNvkN+gUCZEfHJwUJBayItQAKCRB0fwqQNvkN+oUpAQCzr1PYZLdOHo0mC9kK
cCXza1Vj3VRNPMegCSi/y9+LogEA+lwceHgTNihH2EfhRGIEMRyJCSyze3qnj0bM
2vS1pgHCfgQYFggAJhYhBAWkDPznJp1h2XEAoXR/CpA2+Q36BQJiXaVyAhsMBQkB
4TOAAAoJEHR/CpA2+Q36hQMBAJQdksAMGUeGOri0s1I5uIdMJmhhegBeTk1GZpbx
5oKxAQDyJegbW7BJHeFd1+GFSluU49tsGvF8mlUzdLb9LiJWA84zBGJdpfQWCSsG
AQQB2kcPAQEHQEYOlTQaog5wQoLiS6u6OTaKjyi2mXKU9WbtwC/v39vdwsA1BBgW
CAAmAhsCFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmRHxycFCQWsiDMAgXYgBBkW
CAAdFiEEuKg5qCb8JioY2PpzebwZ89nearAFAmJdpfQACgkQebwZ89nearAP2AD/
ToBHghxjebEQsJ5lINO0PlpCTSXXry3IXdmFTvkEUHkA/jjaGla5ImGH/q1xYjt0
RbBybflzR7ibrXcoMFqkAqIGCRB0fwqQNvkN+iVNAP0SzMEkBYft0Mch8owZAl0G
ePG2w4C2jSdSvvZC7owfnQEAzrnZuanxmAohlm6JFxel+uU3qzdIgBq2bJsDwXnK
Cw/CwDUEGBYIACYWIQQFpAz85yadYdlxAKF0fwqQNvkN+gUCYl2l9AIbAgUJAeEz
gACBCRB0fwqQNvkN+nYgBBkWCAAdFiEEuKg5qCb8JioY2PpzebwZ89nearAFAmJd
pfQACgkQebwZ89nearAP2AD/ToBHghxjebEQsJ5lINO0PlpCTSXXry3IXdmFTvkE
UHkA/jjaGla5ImGH/q1xYjt0RbBybflzR7ibrXcoMFqkAqIGocoA/j+eZa4A8PV9
SfjDjTevuuodrN5Ajq3t8vhoDDR0NmmuAP95JQyBAYiVTVCEVs3gzMXnL7HkjeWc
GOZEeJL7u0cxAw=3D=3D
=3DLApB
-----END PGP PUBLIC KEY BLOCK-----

--------------7I5MbiBmF0aagSQ0mmlq7wcJ--

--------------Mwfg5074Lu5GyRsxkP9P152I--

--------------bJW5jYP9mXUmPcTic0vJso7G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZa+5VwUDAAAAAAAKCRB5vBnz2d5qsNSp
AQDePvujRNsM0ercZGguLj44xxfcVR6aepOEAeH3U0reNwEA5jFaqL4Dc972V7fLhwvUjrPzg/ia
5R0QpSUs6tE8GA0=
=Kc5N
-----END PGP SIGNATURE-----

--------------bJW5jYP9mXUmPcTic0vJso7G--

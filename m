Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E69CA686039
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 08:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B950F10E0D8;
	Wed,  1 Feb 2023 07:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01olkn2055.outbound.protection.outlook.com [40.92.53.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C12210E082;
 Wed,  1 Feb 2023 07:04:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDtpkAGkrerXsUPgHrGn6gStGmTUszZJZW0SA7enN4kIl9kMLHxDuuYQODCRLfNSemLuAynKeuFHviQx/VUfpsTsefUa3iJAf5uXUDeFEqClgK3gRw5ItoKzgBbu7eWIV/RVDssOQfa3lBezPdobytjfdEy71AGgSIWyOv7MoqzzSB9SJpu6/PZiW8sIOMuz69cEFIqtxnJLtEP2GnfKivhaGNxrca/1KbpAGxSYkbAjVPLFO9SCb1/72HsVOhgbPYkO4XyRvCEZ0NA9VzYbrkrmch7rV22pqJeGcgKCewlyrlCPMV4+0xq3jMK0ECDMeIjVMx7UtxBZHz7ab2OYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrcco+LV1TxFH+WyAZodxuh4r5sxBY7CK9VPa7tjiD8=;
 b=VqrWHt+sOcWrj0/D64SkzOF82ZfnfdRGgfpiRHiJNkEJOGTzxtN79X5yRcPcBlBjV0F1zCR4D4f/O2/qUthNhRCRnga/970rrvE3Oq08UncmYAh/bNP0jj5tWjeIOripJfvVzB15B2xiLf9iewGs+WZOLwRZhv/JSKmi41nMXOOAoV+NOeWQqnTYTYlbZ1JmQe2qdoCd3QoG+35HMXaCLvwiIDTOceN7ALit7wATZFhhQqxh/W4NSoJrMqW6DQwZqTbJd1jPmbKPzIkNVHAjoYizcy0h5VEH/q3eX72CCZGtrngrp9/PYLaOexOWOwTTtgQj3KDc/Xw7bTpG+dUeKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrcco+LV1TxFH+WyAZodxuh4r5sxBY7CK9VPa7tjiD8=;
 b=LL5EQeyyq+7d7yKSZ7OGvbKC4qH3vqqyYyq9wZqZe3bJIynsS4KOcbLOUK0Z6Ze6GT1zr8hXY3W3d5DoDC57u3a9JxoYWtHHsAv7a174xyP1C6rSFI5/lAXskFZcN4Dvp743ieLFIlNGGlR2tnf7Jqa5cKpCV0QEP7SuK/CndpCKu76bisvV/1ivEdsWekgFOM1XgwOy4PXU5v1ykAEcllOG5Jm1fqzzpCIve2qNKL2ExTiz++pWKQVFo7jS1664XPamgtm/B6ClLUAibj32aYI5ITK4v282exInnnzDyTmubljTW2U27mJn7z4tF41qon+l3Nmy4RqwJKVEbaJ/5g==
Received: from OSZP286MB1120.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:135::7)
 by TYCP286MB1610.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:183::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 07:04:31 +0000
Received: from OSZP286MB1120.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5b41:9c59:bdfb:d6cc]) by OSZP286MB1120.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5b41:9c59:bdfb:d6cc%7]) with mapi id 15.20.6064.022; Wed, 1 Feb 2023
 07:04:31 +0000
From: Yogender Arya <aryayogender@outlook.com>
To: "freedesktop@lists.freedesktop.org" <freedesktop@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Necessity for using the component helper library for DRM drivers.
Thread-Topic: Necessity for using the component helper library for DRM drivers.
Thread-Index: AQHZNgtut7SPj87Tg0ykjCcuI9aEOA==
Date: Wed, 1 Feb 2023 07:04:31 +0000
Message-ID: <OSZP286MB1120AED87F79782F8083E3AADED19@OSZP286MB1120.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [svgmApdyB1Q7loPkW3Q9QMju2Wgk0vrb]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZP286MB1120:EE_|TYCP286MB1610:EE_
x-ms-office365-filtering-correlation-id: 3c606453-08fd-49c2-caf4-08db04229176
x-ms-exchange-slblob-mailprops: Vt1MYR2q4OnGe06JiZj/6M36mhkz0qL1wc23nrINBIbImIIZkG0fhZcSnc6zg66hvEOXkQvkTqY+9mukZoGUkiV6oKYDcn+NzMFM/6OZcnlJNIF8MELcS6j3294btBnVonJXi5jTGUL896WgZcuR5dW7Y6YILZ9gGkI9vk9CbbWJ99OrzeDthbizO9h55O4bnqDQ6qFaOyyQwsnsa0K7KOuNWxP8h1D5lLYOuwH7M3FVXPbN6dZkJt4rk274ZaY/qkSHT34VZQwhkSjPjT4ty0P6aScs1R83sJxKLj1pvSO6EodjSDvacEDpumQA8gPWLaSy4oANU25oWEvEGerx2hUWrW6lshU84Ojy2mou6FUc1TJvqgC54LgUV+4O4EyVppaQUIpUOlC/TsDx4wkWLbU1RTfR78krSjKMP/fiZuYAhHrVvFaKuTCsRvVrt9KHNzrGd2FLOSRvZqNySJ3idBxKpwf00baCuP9i8tA39JJHPUcRK+mnbZcOdzPT3/JTq0Z/YL1kO1Mmxph7t/gL5k6Xu07/SxYsu2M95AZTCL+usZhl7jfV/xH7HnsWNHG2rF0pdJVdi2IrF/m3uYb7xhjZHdQG2q9DoJX6R35d+BJIvAxaljpidfF6Osr8wIAQXFuIZqkc5UZPmxUq8bAAo1jtieomg9/AREtH+FwxolJdHrl6Ia5MEVp4fpsyyr+7RxdL6X9hSgUPrI+PecKdqcrqPS68L0kt
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kJJXX5Sl+p0ms3JN8VrcYHlY6wzQIf+Msf5dPyoMkFNwUH+OUhhZBzqWBsrIsaB2094+fYhjN1auN0BmsGL4InuEglVNQpi8Xo1/zgwQZOvrG1JQFIk7W+NInm9jhFiz9/C2fdpSxzRI4XNtJ6xrIHUgUe/XUXEDn46bnu0tsMgusVd3lrdL87mpF2E5plEhRBMAkXCA4lBjScracG8DplUO358jcfgPZDeuODmtUetictE+jrbqPRIH3ni99tTkCM6jTzKOioQL9HnDkKDXgl3e9r5zsLBEg4MpfjullJjsgcwK2YodVhqEss50nhn1bBKHKdcOao+Gd//OGwstEGEZsbhG4q5uM9kjFAC9ThBc2Rk5h7iHnk8YyTST9Rny4hhugpayUTObxi/ADPnStT9REnZp4ZaOxrAxdeHGXTefKbpM4BGRfC9jRC5lRBgaGiUb7nPm31RVVvTl2JIV0cxMFx0RnsjdcTtJ7dfxNAIwX1eWq+dCWPkE1s64GeXdNurNn8AQL8W3bWsezsps1VI4yge2ZBLjVF1s0kVkM8/Hi3P8CZ7UaXkn+p/jwlS14OfQZXlbiePlWf/zTRfTWky5gl9fZwllKmDApxEook4s+nqrQxtGKxfQEC4xLADaMYv3cxg7JP5OEmFF3JY3gQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vseTWap2rnuR/wvJUyA3kDRjVRifMY7r9D/2kc1O+QBT5fOYPJ0cTpqGBD?=
 =?iso-8859-1?Q?5rofl3cFkKFw1xr7pw5jyh4HNVOsNKWSCPBCAZiAw/wQiQH+Gmc0sb3Z9Z?=
 =?iso-8859-1?Q?k/SscppAId+Oe4Z6FpRfzxq/rOKzyUZe3gQbMfUojLNDAcdW9Udkxl1gow?=
 =?iso-8859-1?Q?nSUDhj69wBlA1/SaXhuCk4to8HQMS3Xzr5QH+g3mapzxzwy7L0+TjAaq5F?=
 =?iso-8859-1?Q?TJiQ1GRUa3VPJhasXh+zkYE5pCkcTGxXDbfV6IGyIsdoezkGxEfTsvPG5q?=
 =?iso-8859-1?Q?GUNPliTPLFF83FDiWLoW7Wab9Kbad8gFQrX6L2LyNnRfx87SPVM5I/JA0t?=
 =?iso-8859-1?Q?eFtMdTml1R5ADiNNyPcFrqNX7uSWny0yNPV1tHrHWabZ9yc8jIufZ0+wlA?=
 =?iso-8859-1?Q?86jayhklQYGDVegvuHKmSOLC1+fSJq+Tnk/B7Sbl6Ej713gvpEciCUnWU6?=
 =?iso-8859-1?Q?P2XXZS6gPoL5HBKxzO1xd1Wu1BnUSXlJoyyl7TVAYvYdis1V7eTx2uvzMv?=
 =?iso-8859-1?Q?eL+4HEp6XTFTNjaejAcSCgFBdn2EkVAyFNGTSbdzOzl0sGsral7vClYG3i?=
 =?iso-8859-1?Q?skJV/wL7QrZK0k4Ke3TR7SBlMaEOMRDrsNGy/rNmvWJQc/kcpuoGquWp3g?=
 =?iso-8859-1?Q?9MtHkLqGHVIo7fAexjyzRZLw5GEcBBaoV8RqyaJOJlOu9PV1g5/o/f7Imb?=
 =?iso-8859-1?Q?83aR+/i06WpOG6Z7ORl8U0G/8SV0zvIey7qQ0A8jYCd2Y2FhofNHpw+tyA?=
 =?iso-8859-1?Q?YwByJvpfHH+/p2A1823yCssvzpuCVyJyLaj3s//KE5/RZ10i5Y0TW8nc5i?=
 =?iso-8859-1?Q?L16H23s5bi2ROxZ8ThvBLzqUgcFeKf2uxtxiMFvYHMNPwWJxPsoF9W6h7G?=
 =?iso-8859-1?Q?i/MahAWH0Z/92OzxDQ2oahbcc6tLaRbxtmU93MQztUs02ENwrz/FRH5ZN8?=
 =?iso-8859-1?Q?uOlNdIdU438COcJ0lVxW2km3GHawPw6i85/9477YnBHW6LwUPIi/VeHfxJ?=
 =?iso-8859-1?Q?ufXPE0/+wW0l/z0YtFahCeMn/b6Jmf2vbnyQmyXbhSYIG4J7qPdlD4Vryn?=
 =?iso-8859-1?Q?LU+I38z7YFWXXu6LImsddjSihzltJk0Xm5x4L/GS4CMFogH3dR9zjZT9rX?=
 =?iso-8859-1?Q?PjzqPYQBFwKdm9L8a+tHCoVhR8QDn1l52xpT68RNOXikyVmlgZP2RZhpAE?=
 =?iso-8859-1?Q?baBlkvCo4DyXHcoBuNPPKnZpqF5rqW8eMCYEq/bmGcBB1/dWqu4yyPi2nD?=
 =?iso-8859-1?Q?+K9bjlDFLhSa0iFpsaQiw8fGfiN/NaGFu2F1hSCv+5xeOCsni2DXPcjKWf?=
 =?iso-8859-1?Q?uebXkE/vvn3NlZSF6wQSfDwzSw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB1120.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c606453-08fd-49c2-caf4-08db04229176
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 07:04:31.8624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB1610
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
Cc: Yogender Arya <aryayogender@outlook.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0A=
I am new to the Linux and DRM framework in Linux. I was going through some =
reference drivers like VC4, exynos, etnaviv, Renesas (rcar-du), rockchip. A=
lmost in all these cases, they use a component helpers to glue together the=
 different IPs under the hood of a pseudo master driver. It should also be =
possible to let the individual components probe on their own, and they indi=
vidually register with the DRM core to provide the required functionality.=
=0A=
If an SoC contains different IP blocks to render and driver the display, sh=
ould we not go with the basic probing for each individual IP and then regis=
ter with the DRM core, rather than bringing it under one hood. Are there an=
y inherent benefits for doing things the other way?=0A=
=0A=
Sorry for asking if it is too obvious.=0A=
=0A=
Thanks=0A=
Yogender Arya=

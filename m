Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8D449548A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 19:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9476710EB11;
	Thu, 20 Jan 2022 18:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB0E10EAED;
 Thu, 20 Jan 2022 18:59:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbP7owUb0MiMtfnSQ+VssbCiuxMrkUaTk7DIXNpI6nJSbYfMZMGc4yYiT6BAHTjjDy9DZqrkAcTA0gCYosCk2oimUtvREIRiKNQlS6zi6eoWDHoYPePMgbjn02P7ADcPp7sx7OvbpPkikzW2z9Twg/cfO1CK/IZZDM5yQFJNvlCHca26cUO5XZ5EJr+tP7TQB6kTji/kPbwEPSaXdbcyaz+RJ0VklKe4o2o8PCxyahYXSV6v5PYEJR70KONDelRBNFiivuOoKVhELdJa6KkUoeDrQYwHt7DdX5bKRCdDWQYvtXkudDoPHEQqQl3AME1x/1vYIPxR/FQBgtMj1rl4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWI9P1uZVJKtvF6VlSJfJJcFOAkDSHmh7kCR5Jz2xzM=;
 b=ErFp9s/Ga1dPQDn7mHj52vOPyH2HGXiCC2x2gS4oe5uePfWP5EBy5uVVhLCAfySXM+LJwsOKkSAIq3F6uMMV9vhI/hUmJx/7Zi005FHM3qN8HNO40fsGX2btErRk+ICdHYlro1knwf5Bs7ObSWQ1w7VP1rWks3IY5c0DBTbUjDGBqReh8WBYu69wBMWFQ/Gfbo/awlOWFaoSQfyUuqonymCsnwBLcxF+6bChYzD4ACyukOo55ajLqyjrlpYN1W6ifrLouSpAzwfRlo8FPk0mvA6BAlLNDq4AkTpgNGFfsJQv01NWbHDaobINGZMIg8bAUnNIE9lbiwI0AwHbr5vd8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWI9P1uZVJKtvF6VlSJfJJcFOAkDSHmh7kCR5Jz2xzM=;
 b=xvO9vZwF9Hy8c+5neXxadOTLx4qaOH/+JHyrY5Sr3cTzUEXkt5CrQs/ncu7ApFkZOyv2/sohFhbWkSKNWQea+SIUxK/M3CQPb9Y+x0CyC59QkwEDmdYEyIv9zXGORWf5VNwENPq3/+4BAt5fz40HJmg7qC1+fHXZDFzD/VLJgcU=
Received: from BN9PR12MB5145.namprd12.prod.outlook.com (2603:10b6:408:136::20)
 by MWHPR1201MB0271.namprd12.prod.outlook.com (2603:10b6:301:57::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 20 Jan
 2022 18:59:27 +0000
Received: from BN9PR12MB5145.namprd12.prod.outlook.com
 ([fe80::d46b:da7c:bf31:5ffd]) by BN9PR12MB5145.namprd12.prod.outlook.com
 ([fe80::d46b:da7c:bf31:5ffd%7]) with mapi id 15.20.4909.008; Thu, 20 Jan 2022
 18:59:27 +0000
From: "Zhang, Dingchen (David)" <Dingchen.Zhang@amd.com>
To: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm: Add PSR version 4 macro
Thread-Topic: [PATCH] drm: Add PSR version 4 macro
Thread-Index: AQHYC/JjQr2Ypyt8M0iTSSvrmFDkmqxsMnZ4
Date: Thu, 20 Jan 2022 18:59:27 +0000
Message-ID: <BN9PR12MB51450A21A0E6EBD35CC763238D5A9@BN9PR12MB5145.namprd12.prod.outlook.com>
References: <20220117223339.45074-1-sunpeng.li@amd.com>
In-Reply-To: <20220117223339.45074-1-sunpeng.li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-01-20T18:59:27.062Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
suggested_attachment_session_id: 8723ae94-1b87-d118-08a2-1af013a98820
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 756dc131-f699-482f-7392-08d9dc46fbb6
x-ms-traffictypediagnostic: MWHPR1201MB0271:EE_
x-microsoft-antispam-prvs: <MWHPR1201MB0271EAD4854F6C4D05C611178D5A9@MWHPR1201MB0271.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vz5zHYLvbbKe+vKb3XTBjnewkuDkFtRmsLqoQTdhp1ZvnTNxWIwu+ftQS6cpAafcDTNSTekMYPmIRzDiesoQbwO3kQp2+ur70k9RjpaD4pxRZhiirAZCg/pzH5dL24yk3IsuYsuZ+If9MZAxvpcyYHGpfsx4pJuW2czjkEB/5sWQQGiRQgj784R5j/r7cINoMGkjJe/EFbKe40ldqeERRM9MUWaAbnyeJ02dL0NVAWiQ0jAA69vk295AlJ909M5R8pbqWo6WS6PWgBWPCnBBnxB0lOci5F2RX6KU9drA+WmL3J8rJlBy5CvINlyY3uWUh3ADoj6b4eYGkMAymuOcYbmT1cqNfHYaN5cBUE/Mq7E8tl7wJe0xUQP6kAI9hlHq5wnH8RGinALn8jhCM+B5V5IYkyPU9V6+7eHLnCycaZBCYok25tRU6s8XH1xVFL3LAV9KZYG0eGg+1C6F6vLYD8uDSeur44bkHPj0MXdT8UrA6iAEBIPAjE+WAU+YRVFbsGqx4+46AgZVVdlFGPVmJZwOxgAo26W8AKAmMaht0MUUdEOTbMUbP+Z5DJAe9N9vDGUJhIw3HTTAMAGAL60ROQ3ofzXjRw8lqHNA8zu6S0MJnp4kv+dznQWraGuM4jixoZ8nCuIBnEKVzl584rUok2E+8d7DqokOIZo3FnQomgj9CvtpfJWM9VewUys4UfwQRvP1g3XOnEMpy2lW9x/TE4d4sq6YExkZIRx+3DfIXLY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5145.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9686003)(186003)(6506007)(7696005)(33656002)(71200400001)(8936002)(8676002)(86362001)(38100700002)(2906002)(53546011)(508600001)(26005)(450100002)(66556008)(66446008)(122000001)(52536014)(66946007)(55016003)(91956017)(76116006)(5660300002)(83380400001)(110136005)(316002)(64756008)(66476007)(38070700005)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LlD3XETrmwwuFldUJNJ6qBaELupugc+BB1zqbtBZP0hVQ+dFoKgAFTWuGq?=
 =?iso-8859-1?Q?XpY+6zFV49uDyZRcVvH+2b9K3+SFEE6qwLGaTlgXqLWxaOkpxqDbp4LWSi?=
 =?iso-8859-1?Q?FOrWByJn0SQ9gW2upyv0At3r1fJ43Y+XyzMBY/GdI5uYkklMI5fMuAO63p?=
 =?iso-8859-1?Q?x2AeFRvqosmeP51pTGHcI4A19SJg87figueBYwr5gXB0EK2cvqj0bqBvba?=
 =?iso-8859-1?Q?pyUjfgskUIQHFRGqXth2cL5CNKVngoZn0e3uJKUcAnIAqYAC0jdCU3Vck5?=
 =?iso-8859-1?Q?b794VsVkgWSlJBVL99OrpaUJGcVtyPcYQcy6L1UgrknOusC5OFY9bdL/zK?=
 =?iso-8859-1?Q?UFvwfvD3vCUKXS3UUHPYO85Sb3CG7B/csemxWI2MFMUjoNBHE/H6rNAHE+?=
 =?iso-8859-1?Q?k+hoJvFiAueQbIoIpxiVRgBK/mvpOgG1V59s4xoq2MhgdRc+DEXG4cAL2i?=
 =?iso-8859-1?Q?cZF6MeVClw1Vj3qHvTW9qeEElK7xrmOtTc+ijpmFNxkUsxspKYKi0SnjDE?=
 =?iso-8859-1?Q?Yb6V5MqyH24F/Kd+RVwLqIFypaes8mzRZT3tFyMOBxKH4oWWO44aOxCYP4?=
 =?iso-8859-1?Q?IqPlxqNIsEzoT+TsvzH9JNH2KvMSOUVAVQcxyMec0rKcCxiMgGC022cTAO?=
 =?iso-8859-1?Q?PM1zDS9Bwje5nVLD2QmNWAcacDG5gma5oC5+1ZZGbGCf4qls+yZDv8UWB0?=
 =?iso-8859-1?Q?oztHdW1I5dRGvZhRXOKS8Hsf1ueH9I4XwI1wbz2HA/8qNVL5eMm3K362xr?=
 =?iso-8859-1?Q?zsRYEl65EgKysl/9w8OxvLjyQw8D5uf5+IDC+Ds0GTZA25r7uPaBDGb6pM?=
 =?iso-8859-1?Q?v+Q2a2A8iN9svb3ktXUdH7OuD6uX2Gy345dRSGigRxFZtG4CxJGtcY/jZA?=
 =?iso-8859-1?Q?N93cAONbGealymog50OZm0R9AvUjXGbPfG4apttQ72YU5zP83IKZHIsQOL?=
 =?iso-8859-1?Q?LPkBnaOqikNw/RsVaK5II/BTQwNJgsgyflVkcJV6hbn1fpjJecL1/xv2Xt?=
 =?iso-8859-1?Q?v7ye+woHTC6ZYsumMfvUZYLJnPIJvImU5uohOy1W+5T7aJb4fWwkucKDWq?=
 =?iso-8859-1?Q?6k9KLEu9YCGxAinFomwRlteeFDUQLKi4b4uUGx36iqSvnFD4i9mcnwWP6T?=
 =?iso-8859-1?Q?tUs7E3QWaqU5S2Dxs92FcOs3ApD7v7KkHfQsAcE/dooUIwFMTrIbXSCSPj?=
 =?iso-8859-1?Q?36elmQqryuHxPQqM4TbHrDPhMCip5Cmnlx6N2RpalvZVyTQ5ILl1X9hxHD?=
 =?iso-8859-1?Q?cZ4nEjvYQYqZ0njRpbMYfdMVZE1fw6/C3tRuuYXKezmbu/VUvIQ1TL+Ocq?=
 =?iso-8859-1?Q?5KYICaAIa+K9hdcOPDz9X6/q9s3yQ7ycPH/lTvQZKSrSXpUMczoe11d4c+?=
 =?iso-8859-1?Q?rW3SPIVIIYw/ifRjcfY7MtQLynNPr0l0ioBh8fn776Fo3N4KZLJ+1quSG0?=
 =?iso-8859-1?Q?GuV+45eTmW5i0OWT6+fizDW0Nj0+/FjRCjWG3zr6q7jvFwgcS95GZZqBR6?=
 =?iso-8859-1?Q?n2uH4zbAZ1VMMygwBWnsnpE9DeN0m1NPOpeM250rn7kxiwHMBC8yRUjgDL?=
 =?iso-8859-1?Q?4Br7LkgtPS2bESOwM703W2owByqrgjJwcEjqMyB3xPfs0aVH/qZyysQk6N?=
 =?iso-8859-1?Q?OFRKfqd6uL37w0in6Jzr7tVTwIJX/5sOSEDNsz2KRM2UPvRNt+6ENWZw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5145.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756dc131-f699-482f-7392-08d9dc46fbb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 18:59:27.7748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: esid6MXTpMRnCzs4DzuS1+RzRT7T809RhiedUGY6LtkQHz1Z18qfO9vLvJrM0MOs+CFsdfzbzRqpaCS5vbh/Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0271
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

[Public]

From: dri-devel <dri-devel-bounces@lists.freedesktop.org> on behalf of sunp=
eng.li@amd.com <sunpeng.li@amd.com>
Sent: Monday, January 17, 2022 5:33 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
Cc: Li, Sun peng (Leo) <Sunpeng.Li@amd.com>
Subject: [PATCH] drm: Add PSR version 4 macro

From: Leo Li <sunpeng.li@amd.com>


eDP 1.5 specification defines PSR version 4.

It defines PSR1 and PSR2 support with selective-update (SU)
capabilities, with additional support for Y-coordinate and Early
Transport of the selective-update region.

This differs from PSR version 3 in that early transport is supported
for version 4, but not for version 3.

Signed-off-by: Leo Li <sunpeng.li@amd.com>
Reviewed-by: David Zhang <dingchen.zhang@amd.com>

Thanks
David Zhang
---
 include/drm/drm_dp_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 3f2715eb965f..05268c51acaa 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -360,6 +360,7 @@ struct drm_dp_aux;
 # define DP_PSR_IS_SUPPORTED                1
 # define DP_PSR2_IS_SUPPORTED               2        /* eDP 1.4 */
 # define DP_PSR2_WITH_Y_COORD_IS_SUPPORTED  3       /* eDP 1.4a */
+# define DP_PSR2_WITH_ET_IS_SUPPORTED       4      /* eDP 1.5 (eDP 1.4b SC=
R) */

 #define DP_PSR_CAPS                         0x071   /* XXX 1.2? */
 # define DP_PSR_NO_TRAIN_ON_EXIT            1
--
2.34.1

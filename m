Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC2D788844
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 15:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A5710E694;
	Fri, 25 Aug 2023 13:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8183510E687;
 Fri, 25 Aug 2023 13:18:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MybZH0VOKyI5sjmVBkinzdWWvW8WA/OCB0bE6b9M/DVW7V0wLbwxFjOs6yny7FJ9irZrEy11/WqkgKTIrmG+sQ6jYEmOKa8ct3DYWd7ijSa+aAzrauvW6GleYLc96ZJfuLQX1VEpC6TqcWScepwIAiVR/+b5LgHfPY4LcGs77ielbe0jURGFxaf1KT5GSqoJ8w/WG1WoNsB5dxWSMO9urQdjhEA5A4zgfLEjdBPv8ivv7xU4Nar5HPTRHoXxyjVOmoLSH1hkAWfAjJ5S9RK/b0cQoPRMFlAM/Xzu6QoCuies09NoqLFUbqX9p7xz8pIfWLSc3fmLqXafUu9YBiLufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jfqGI/NCKAHGgCCjvVGBsLmnm2CyACi96juBAixLPg=;
 b=i1c2bysrwQhSm6cqXHJKb7V6hO5z6VaGc0eDif3TdlBp5Y6vOTTaqNtQk2RlL0lbc7juTmfLcc9UNg9nnYNjAg2auGnVANEGpC3dxp0LR7jRd5HvceFNjGuwEvIXD0QZnjCacNyXihqOhZGZgUbOZZNbgorjgWdBA7Zzu0eRAQyOwo4Ab1uF0NVOMI39Rp0nW/aRpccU4qgI7USIkiS+Z0xw/fqofgr5O4Ol+0YNFw2LwP0/VsaHM1F+uc0cO4Byzbe07vthYlJ+BHALnFlAxZGDSG7YOo/EdYNI+f+ZCwLQ0EDWyvWKsbuJXdPpTV1YOIqxU+z7ebsTS11MSJFUzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jfqGI/NCKAHGgCCjvVGBsLmnm2CyACi96juBAixLPg=;
 b=0lXiIFhQeKJmVrDSVWkajwHG3BikWHhQojtBwOIg/fqecrFC3XfqL47Mob3iadWsTiSGxU47UqF3dEb1zrGNQBFT8CxPY+6meVjuXxHoD3zJB1dAw5ePaDKI7vzsq3EPDtwfCl5EkmN6sam3nPyGprTwKi4599tNGzgexQ5v4cE=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CH3PR12MB7499.namprd12.prod.outlook.com (2603:10b6:610:142::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 13:18:17 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::bcfa:7757:68bd:f905]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::bcfa:7757:68bd:f905%5]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 13:18:16 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>
Subject: RE: [PATCH 0/5] Add the pci_get_base_class() helper and use it
Thread-Topic: [PATCH 0/5] Add the pci_get_base_class() helper and use it
Thread-Index: AQHZ11ReS6Xid6VNaEKMobHHYXT4ka/6/l7w
Date: Fri, 25 Aug 2023 13:18:16 +0000
Message-ID: <BL1PR12MB514444DF0C2E304A46DE0F4BF7E3A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20230825062714.6325-1-sui.jingfeng@linux.dev>
In-Reply-To: <20230825062714.6325-1-sui.jingfeng@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=7d9e38cd-c401-4f88-b4eb-d41d75060a99;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-08-25T13:17:44Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|CH3PR12MB7499:EE_
x-ms-office365-filtering-correlation-id: 6672d42b-a1b4-40aa-5e71-08dba56dbe0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CPc8iPhpAJ+LrRVonZFZT9asQKX0IxfbGpo9SWBfgBukgLMvnYKREAlT5PvQlFY/2jAegVefBF0K5bLEVKHaP1CLO1ZJOW0LT+fvGlgsOIr5knwUHhJqq88kw8T/gm9YBOHNmP0PLn+pWnutkzfMgDWPUYQYRWvv3A/Hetwa7wIb8KOXemh7WomxQLjRFyNpsltFpd9Y1ORGtOJegsMXx4a1RcuRpbGQBkuV7DW3/iQpOgtpIK8Hu3VrCG8u6516otO9iq/Nal3frcvnW28xK/ovpvajTbK9SeoUcHE79RWg8DBW8TB6GiSC2fiJncF1RB979vrQz/gELkPMsK7jpy3S3GsHcLGr3j5cG7RAlxIVZpDONRyWZru4DnvuJuSLyS25/kZQniccNCe5qCpVnVwVT1VWmyBaa7GK9an1Kn+rJLi8w/iapk41nBcvSRaFKBAcapxlvBV5GICvg0QRg2ud6BS9QhDwF+YCRY9rLKFD6AUnLcszLIjKbtkTvcpg/pU8INwFL+4Ot4crOmHuqUpqFyRCDODFicDjB/FymM0Xjf7wGTps7YMLm0Vvtadqa8EY0Tpmq5rD0qq1xpRpI6iBeLthihdiQqRAwYAuI8s6AcCM0kNYKB8YB5zg7rIz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(366004)(39860400002)(376002)(1800799009)(451199024)(186009)(83380400001)(9686003)(478600001)(26005)(55016003)(5660300002)(52536014)(2906002)(8676002)(8936002)(4326008)(38070700005)(38100700002)(122000001)(66556008)(66946007)(76116006)(66476007)(86362001)(71200400001)(41300700001)(54906003)(64756008)(53546011)(33656002)(110136005)(7696005)(66446008)(316002)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FG1S/nkUFoGcXqkXyLbjM8ER3OMvL3krfxPS5bFo9COWvvlUWU41hS4g+WqJ?=
 =?us-ascii?Q?iKEqcmwGZZiWoFgH34H6rhhBG6lHiF9RnRGkurhhqS3QqvC7C+jKVMSA3CmN?=
 =?us-ascii?Q?rFGPk0/40yXlTKDsxMnXTZieYbJ8azuk0opWE2Gfe7cwr4DuaV1Rd39drAZl?=
 =?us-ascii?Q?QgBx1BVcoizSP04VSRdFUqY55v0MlUEqmfrgJ9LMXoOPei2OsX7f7SiN3Som?=
 =?us-ascii?Q?DAviocqvGaNrd2zJjbK8GT5rYAI+k6RMYM6AUtZvJT+fjyfXgHcLA4VKdD0C?=
 =?us-ascii?Q?AyODrNbjZsJrqhZI6Kv1Ghuq61Q9t1EFAXl0PmdLcT/rw5ghyGk7zqgMdrv1?=
 =?us-ascii?Q?yTs2YQ6Pxy7N37zBuZNSpDXLpQzOg6jmzZt6twGJwBIC8BP3bmghiD4nvZeb?=
 =?us-ascii?Q?8VQgMKBG+Mi59M5mQH5nGFM7d4YTlZPDBRVQ8WOkxGWlcHE85LolnffYX7TS?=
 =?us-ascii?Q?n5qv/7GEJN+yuZH8HxwJhLi0BOrUZb7bkylModTqiCfTT4/NhXzEO5spDTcB?=
 =?us-ascii?Q?mkdvluemPjvunI8dVjlVvYbOyfvlaycs+qBxBrchM8ppkpp0stEPTrww6p7F?=
 =?us-ascii?Q?OMl+hlmnTBQb2gb8HylGXkvHuArGWClCEBE+P+wKYn67llC5ug5IxIZ5fVE8?=
 =?us-ascii?Q?YEouf9npCoKznfkIG3uh8qMKqnmdZfCepU6W4p0qtozhH2XiqVfU6h7Cyc8g?=
 =?us-ascii?Q?AXF0F6h/U3IcJC6VBqnsJrEuBkCv/0iC8GKokPEvuOZgX66v8Zjgyma0dCRQ?=
 =?us-ascii?Q?LbmWswvSuZ10cbIn0DRigH2MxQR4SXPUTq6QhFg2vlfw77Z8cwDg9T/fwRbc?=
 =?us-ascii?Q?YOtgQIlEHev5FstkxAGnR5fm0e9VMeP2/6Khgrztney2F/04E7TVnnMk2+hE?=
 =?us-ascii?Q?FLEkFaXsbXww9Ez/sr+HWSa+DkC/mKj7+10qR6V4/+LcAi50PNzoWYvD32Fl?=
 =?us-ascii?Q?4sJrjz8MS8oMM+QL8OaesNydS3dTA+rI8fqS9ArnbiJ5EjvJdMv3TuFxQsVb?=
 =?us-ascii?Q?Hp9TAjllO8JbcHYJkHk0FbbFPtULwuaa53jPJb2EqHQOy8hPRBUHVW3yLeTr?=
 =?us-ascii?Q?2+6bDQyxcvYEPfmMiTbecqz8TpKRhaWNp6ZwjlbhH2l7gBOxqpCEp1rmv0an?=
 =?us-ascii?Q?Z74a0PIaYM+C/O+wgSXbc2Go4rn2yB5P1jyth4Np1caiv5t/M7jZoIKLGYyI?=
 =?us-ascii?Q?M+kDRPQkV3svKwvi/ZKLKrKjfcVx62vr6ubdA6vu5/KWc7Bs+UE4iuSdPaoO?=
 =?us-ascii?Q?UGCQFi0IsMbhza1Go/mGXTRmOJfiBr3v+e87LsoaiC8eNcZ4fGqieThkV7Gw?=
 =?us-ascii?Q?X7w3MT5DeDaefqLi3NCOGDok3vruWUSBTRunO9CjqD6xyUEgy9A42O5WNiP8?=
 =?us-ascii?Q?mmGdi+DfdesL4qcWA1SUb8pBY1zqXOAk+enjIrnIA1sJImqdPJaYqD9XUAmy?=
 =?us-ascii?Q?qAagyBcSVoCNapCAeVPLTJCAk9ARrEkWtqzEUCv1JCW/0jMCv+G6bEUgA7x/?=
 =?us-ascii?Q?gLjspB9wDYZN+dscgJ4SO8YsnakQ5iAmm5YBDVO3Y/uZXH5CaT6DcWcQ1Kad?=
 =?us-ascii?Q?KBsKlHeMPzCW5W8PeIA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6672d42b-a1b4-40aa-5e71-08dba56dbe0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 13:18:16.1492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lBprIzw37io+C1NC1cCKSHBQPzyfhk7T7qF+Ro2JZj4ORY3AgSWzeeuj8i+oYnUMP6i9KftGJ0XvdaWBqORL4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7499
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Sui
> Jingfeng
> Sent: Friday, August 25, 2023 2:27 AM
> To: Bjorn Helgaas <bhelgaas@google.com>
> Cc: alsa-devel@alsa-project.org; Sui Jingfeng <suijingfeng@loongson.cn>;
> nouveau@lists.freedesktop.org; linux-kernel@vger.kernel.org; dri-
> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; linux-
> pci@vger.kernel.org
> Subject: [PATCH 0/5] Add the pci_get_base_class() helper and use it
>
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>
> There is no function that can be used to get all PCI(e) devices in a syst=
em by
> matching against its the PCI base class code only, while keep the sub-cla=
ss code
> and the programming interface ignored. Therefore, add the
> pci_get_base_class() function to suit the need.
>
> For example, if an application want to process all PCI(e) display devices=
 in a
> system, it can achieve such goal by writing the code as following:
>
>     pdev =3D NULL;
>     do {
>         pdev =3D pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev);
>         if (!pdev)
>             break;
>
>         do_something_for_pci_display_device(pdev);
>     } while (1);
>
> Sui Jingfeng (5):
>   PCI: Add the pci_get_base_class() helper
>   ALSA: hda/intel: Use pci_get_base_class() to reduce duplicated code
>   drm/nouveau: Use pci_get_base_class() to reduce duplicated code
>   drm/amdgpu: Use pci_get_base_class() to reduce duplicated code
>   drm/radeon: Use pci_get_base_class() to reduce duplicated code
>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 11 +++------
> drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 20 ++++-----------
>  drivers/gpu/drm/nouveau/nouveau_acpi.c   | 11 +++------
>  drivers/gpu/drm/radeon/radeon_bios.c     | 20 ++++-----------
>  drivers/pci/search.c                     | 31 ++++++++++++++++++++++++
>  include/linux/pci.h                      |  5 ++++
>  sound/pci/hda/hda_intel.c                | 16 ++++--------
>  7 files changed, 59 insertions(+), 55 deletions(-)
>
> --
> 2.34.1


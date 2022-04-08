Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F194F99D4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 17:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411AD10F33F;
	Fri,  8 Apr 2022 15:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5911310F301;
 Fri,  8 Apr 2022 15:47:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMlUOMg0wOi7JQsiAqHz0EABZPSA3oU0IBR5rG7wzrrZHJj29WNYMI7ybRsYd6klDi8SB34GUq8S0slkJ++k95YjWfDQA3JsV39+OotYKoJutTo8dhUksM2m8g0BnjorVzpljgFPqLjE01RIm1FJ0/5LTZZ0C3QEadDysh2SQdzGO/9mCO1OmVek6y0Ind8YlDy2DU9SepncHPSI7KoFCRub0v6F6rgioqIzogFyUYhQ6iadhYtrkOFWWHNjeK3fntr+siBMPheSQy1VEGpjqKZiHirDdlb2lZjPAJ1VHg4Qd1pybYS5lQwWh50jQNAEgRndwVZdYoAHxrVz8NxLNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NhFt6KSOUJorbkP07V5Y3xZ4qP0ce3LVGNymT1ZNvU=;
 b=XGvLC12H+Gr+aaF6uoipIomgearMWazrgQ5EzirCayr/SNA9MBDvPo8BC4XK96IWRhjVhD5OsfccgkBxs9/cGATDlbXKjvbsJcySS1P3u6LFsi0J80+MnxVNoeYB8UQ22af2jyF/AZ8jucMWl5PLnLJ63MxRJDBggZ5QuYJexciGrEMDvbCEmgRGhdBKuveET/Q60A4XUiUu+xgfP6PZK9Wt0w47k/5lKXfuwAamRxojWdoViPtAg+ap6WwEbo2Wkwd4LEoqipgEor+hsxGSadeJvFNraclZXKza6gbLMTApyiBC/NtUMuFDro7CG+hOudKIVBJ0XQlS6aIodJrxog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NhFt6KSOUJorbkP07V5Y3xZ4qP0ce3LVGNymT1ZNvU=;
 b=RY3lQe5uyfCQNCNOvkvOMz1AtNnLTk+bN19YzkLyF5SsL1hhYQvEKuNsHbTrlTwyjPphiCcEMxWIYJg8YK/JbcsiFsjS52dS5U6B30GDbm+O9Zz90TSEcP+URf1pa73s+7zk39uwwnDsTzcGdgU9zL9Nj6POSifknFYv3w8zIOA=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by DS7PR12MB6007.namprd12.prod.outlook.com (2603:10b6:8:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 15:47:26 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::70d6:f6dd:3e14:3c2d]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::70d6:f6dd:3e14:3c2d%5]) with mapi id 15.20.5144.025; Fri, 8 Apr 2022
 15:47:25 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: "Gong, Richard" <Richard.Gong@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH] drm/amdgpu: disable ASPM for legacy products that don't
 support ASPM
Thread-Topic: [PATCH] drm/amdgpu: disable ASPM for legacy products that don't
 support ASPM
Thread-Index: AQHYS1+vbeZYg8F3L0aXkBYKsAfwnazmKNIA
Date: Fri, 8 Apr 2022 15:47:25 +0000
Message-ID: <BL1PR12MB51576654D3EEB10F5DF862A7E2E99@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220408154447.3519453-1-richard.gong@amd.com>
In-Reply-To: <20220408154447.3519453-1-richard.gong@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-04-08T15:47:00Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=34266d61-5264-4f57-bad7-5339d5ae0dee;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-04-08T15:47:23Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 849b2a6b-5444-4b7d-adf3-a2b6f9eca422
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4d89494-e0c5-4c56-b4b4-08da19771425
x-ms-traffictypediagnostic: DS7PR12MB6007:EE_
x-microsoft-antispam-prvs: <DS7PR12MB6007F99B1850DA9E5395071BE2E99@DS7PR12MB6007.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cY6yUAHmML6XBj+gLbVmqgqC7EeRDYVDmup3FkbfXmYtBS/CnTzO8cv+Ih/bdHZpt9MSNS7RqwBGfLioDTNUE3/WZuMXA2Ztzzxdh2w3UHYbfwQ1efDutBBgmYIyXmeVX3MqHjKpD62s4JZrVpHiQDS27aFIg6C4PGh8jtoZxKhwYSOo0zjFAidEV10MsDb0ArzIoVhC/O6TwdTcLLRGuhKdtNaTxwGEpAiSd5wkS3kgnphZEJehMDcQ1xzRTNpAX/C7ULcPgbZFs41etdhLAmZDS4BFnuVYv8SI5Skb9W7LvIPyIDWlv2+WLXAKEwFFyJxnjyAq8s5iYTtQ80EXgYNJY92a04ZUWNaIROkLBDYLiGk6shj3X7Rzl+hrBzRJ9Fj2N8kaqbnKPKKzr+QLiLy8Mkw1ssQ69TMOfDtqA2x2989AJvfEvY0UhygedDAQHgH/u0hEpe3/Hm/FR5N2JZK/zmUntlM8JQXUQlRit0E7XOJEqNayWbErGuFIfSuEIX9teKMOPjNRHzYRVTx09rs4Dpbl+6NAxSeiVTLZOczwPvipntOkhqJmCfeQq9r0Wq5RJk5/hzqQ+sKH9JSiBpjbZ0osfADiTYlIcXgKQKK19xKhcAiYlP07xyx4SEXfsS9p6tPIzTt3b7dmciOZGOk5rlV3US6StwpbVQ8pU3ZAi2Xi1FDKL5WTsGiuaT9+vVw80yfZfB0znlzIRKCVKBuOz142HYrk0oFyLAT0M3U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(316002)(921005)(122000001)(52536014)(966005)(7696005)(38070700005)(5660300002)(8936002)(2906002)(186003)(110136005)(54906003)(38100700002)(9686003)(83380400001)(86362001)(66556008)(64756008)(4326008)(8676002)(76116006)(66946007)(66446008)(55016003)(66476007)(71200400001)(33656002)(6506007)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yd2otWw4rYoNWc44MT2fyIFDvNWAAhVLnSRCPBTfeZVLP7Rny7AnyRefPV9V?=
 =?us-ascii?Q?zWdCbrMo/ovtpN5gna8h4lXQyLTdGup83mT8x1oBw9y0CyCtPLKTwQnUnQ9N?=
 =?us-ascii?Q?r+UHYeTuSh/3IzhHtIwlfPjwAzFHvwjzquIMuYyVJehXWRD3u5SzvPmkFTeW?=
 =?us-ascii?Q?ea6OMjfWRJSLjRv9xBgNnziNiz8tQIxvVAagucGZ+HKx/cktR9NV3M0NFRdL?=
 =?us-ascii?Q?2fLNwp3/1KEGoq2HLmuiENO7aTYgKBmw69pWzDGeH14zbAm0gkHoESEbvzqd?=
 =?us-ascii?Q?5rBLyrKs/pnXU7bih3l6H+zSUu8y2CWhYySs7/4oWpXkd1+R4Xzy/90R+f/m?=
 =?us-ascii?Q?AllEynvBD+bkh0etx74DBzAsaDaFe3R0XmTnbGurZQvpbzGpPf8OAz/4zNgI?=
 =?us-ascii?Q?USj9decVumEysv+6rh64zUMITMP9N8/C/SjWfYsyuNbuG7Vg3b+Mj5JL0Q7F?=
 =?us-ascii?Q?3e90uVoWhQzAnYdPAZnqT6oFQ8GsunhwxvWgAaNXDOenktMKrcn52axwKV4g?=
 =?us-ascii?Q?AA8hp23GkLBM3jhCTcymoFOkCGyP9Ud7s0nUiPC+vPiFM86aEkvMq9Bnd+h5?=
 =?us-ascii?Q?lJJvHt6B9Sp7fa4GN+lAfc2T4CUGkEsGi+GfSDfbLJXAP/1fBNcpZttaI1Kb?=
 =?us-ascii?Q?CjgqwBeotvXeH1Nk5hvtrgZU2QeNB0PM+m53dlPv7ZbcKXM1NmiujrVXeNTb?=
 =?us-ascii?Q?pT1ujgGrs0seKiqcMqpnrwhsYGhsiqu7uU5PIWyzs8HO9mLQHmvnkeDjuh82?=
 =?us-ascii?Q?Ag9MAzlRqAtep10S37J4t3PD6UEOU8/TMAeJqbdl5rj9DxnZ6c9KuacJ+8rS?=
 =?us-ascii?Q?DOFsgOWFs7t/Dc0OhRgUIH3YvfG/zZZWAm1BF09olSAzRI3uyAhYIAtU5e6o?=
 =?us-ascii?Q?HMr4TWTdkMETzaR6RHUJZOleYu6TsfZceMMry+EZaMtTRRHwtfY0RTBt1kew?=
 =?us-ascii?Q?IrIUzthnaYTAyMzwsPtw5e/OIgzqgYhc3kK4NJZeXUwaIJ9mJe8Pym4yaYBY?=
 =?us-ascii?Q?/rurXc8VnUruDmRtd28//YoRyOQmxB51KCszJE/IeCDA6QDxclWI4dY9mmcB?=
 =?us-ascii?Q?yDtQh5KuWwD2VoRRFQa76qUYrkCdKFlgSGMBdsxOxf3qD6zAtJHRQIRyMJrw?=
 =?us-ascii?Q?yMRkPdHRePeeuGY7yfupMcbirwgYsWnh+MFtHx2nze9j9CvLlDVaXFTnLKEe?=
 =?us-ascii?Q?Mo33zEy1sNKGC+3A2UoAOC2AeH6iYmmdaxCHGWtLX7b8IHSsBsDu/JwVhRXG?=
 =?us-ascii?Q?i9tL51Zl2YpgI5RV/33Bl7NSKiixrkWlieFhxsgCQuHUQg7/fFWEUxIyDL/8?=
 =?us-ascii?Q?79+2CmiG99JfHcONcfp4fuwzJtIhYGtXztHStD+SY6W7HOdpN+/KYm3xgcq/?=
 =?us-ascii?Q?RVy99M7aKVYPCpfl4+GRpQHSGweJclGPAqrPRU5wFTen1A8GjpbdGw2BRYJ5?=
 =?us-ascii?Q?hoW7AQ4uHZ5NhtJEoG/yrdt/RnNz4r+otr7gTug5x2G5wgaDJJMb6lvIQ0Fe?=
 =?us-ascii?Q?YN+57ATNSS1wGnuOwycTcoqSqcJTtnrhWH305QoHHvDGVRd2kFFHxBq0Pdm8?=
 =?us-ascii?Q?at81N/6NY7RgM+df/ypfXQuhK3/iYEKK+oMlitV8VRy0REikgMQ3nHjH6GxL?=
 =?us-ascii?Q?u8OelopjtnCy6zbXqytAmcdoWBv4sTABZueYLofyJqxZiv/MoISk2qytK8AA?=
 =?us-ascii?Q?ZMDnXU3lVECZSUMowZrYfz8cqUUJZ/+6oQQcaQJLkOi9fQE2iWARWrbBJg50?=
 =?us-ascii?Q?FmDrX5vxf5hmm/CB4LOJ3RPgnarp+aMAYNB0xMABbvnPiS0EazPWT9cmE8eB?=
x-ms-exchange-antispam-messagedata-1: ERnFpW3nl4dC8A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d89494-e0c5-4c56-b4b4-08da19771425
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 15:47:25.4299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9y98nLF4MW17GR079bbgUaUWMMc/QqzDXfV6KV9HlEkC4eO2CZlJJqyfbByHxfODW59APE3EO2NnkVsd6dqzgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6007
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]



> -----Original Message-----
> From: Gong, Richard <Richard.Gong@amd.com>
> Sent: Friday, April 8, 2022 10:45
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> airlied@linux.ie; daniel@ffwll.ch
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux=
-
> kernel@vger.kernel.org; Limonciello, Mario <Mario.Limonciello@amd.com>;
> Gong, Richard <Richard.Gong@amd.com>
> Subject: [PATCH] drm/amdgpu: disable ASPM for legacy products that don't
> support ASPM
>=20
> Active State Power Management (ASPM) feature is enabled since kernel
> 5.14.
> However there are some legacy products (WX3200 and RX640 are examples)
> that
> do not support ASPM. Use them as video/display output and system would
> hang
> during suspend/resume.
>=20
> Add extra check to disable ASPM for old products that don't have
> ASPM support.
>=20
> Signed-off-by: Richard Gong <richard.gong@amd.com>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index bb1c025d9001..8987107f41ee 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2012,6 +2012,10 @@ static int amdgpu_pci_probe(struct pci_dev
> *pdev,
>  	if (amdgpu_aspm =3D=3D -1 && !pcie_aspm_enabled(pdev))
>  		amdgpu_aspm =3D 0;
>=20
> +	/* disable ASPM for the legacy products that don't support ASPM */
> +	if ((flags & AMD_ASIC_MASK) =3D=3D CHIP_POLARIS12)
> +		amdgpu_aspm =3D 0;
> +

I think it's problematic to disable it for the entire driver.  There might =
be multiple
AMDGPUs in the system, and others may support ASPM.

Can it be done just as part of probe for Polaris?

>  	if (amdgpu_virtual_display ||
>  	    amdgpu_device_asic_has_dc_support(flags & AMD_ASIC_MASK))
>  		supports_atomic =3D true;
> --
> 2.25.1

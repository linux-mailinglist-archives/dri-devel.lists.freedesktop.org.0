Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 085D14EF61A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 17:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000DE10F528;
	Fri,  1 Apr 2022 15:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D79F10E458;
 Fri,  1 Apr 2022 15:52:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0xzWfPmCbXvrD6kyWG41cED44Z41Jj5W1PdBJEX+Em1x7wzpiZdDWGpks/NQjIp2uBK/IluzlM42Vf0/wi9YoFso7LY64iKbF+bJ/SVSnJ5EkV3T/nxveAiUvEYKTYtVtMft9JT9AjjJ8rH61Kpvc8bh9sA4wZJa5PfbHlw8M4mynSYzNWDRNmHaDNbgLmwGh7pX3vdSC2L+ooYxEmWACeuv3k16nivElMdoH+XNkKJ/+/YLUw8U02ERiNCgzf6/4aW/OtUQhDQRmCdghZeagWh7KBRflvc2uJManT59vLQW+pj/Y1JKhWMQ0mFwhXT+UpLpESLmKiLINLt4Rpiyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIr9uyCtQFzXI8ytr/wBHdrp3vseUq7+J4gQpPV2KXU=;
 b=aXHwkSJ6QjSQiPgeqUk1falEgtERo6dyp8sWl4X/JqMmuifGmzkOgh4/KCXKx6LX7wnNXJ25WGv6decZ047ioFrcLrmsEhRbJPnH9vXjRlhV8jz5FaHPASjXVYR5aBafwiJ+cTHIgDg2zdbjtImzJrQd7K7e6Js4SS5iM8umt+dNilq2J+R0AnPQWoI8c6rOyTpJNzjIVX9aK3LSaR7bf0MF6kYqckolricJfiDTwVVlmFpLl4qtG9C/FFaToOueZ01PtDCT9R4bDMoGeoXbZco8xP9Daa/ZWo5t+iuZHjXlWC14iFdNBI9/ZA7k6GIgbNAAT6h9j2AkG3i76RaNZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIr9uyCtQFzXI8ytr/wBHdrp3vseUq7+J4gQpPV2KXU=;
 b=PfhINuXldHzxDXM8vWX/1EMeQZnYkZbB4uuUIx46T0Wo1SMLm0/3IARTXhJnmfOZ2nkRPZUBrtCvm+T6oN55KCJZzKAeziWKZZ1IIVb0zFbC5+IJEWqSDos95+lsXwEuFt6UXnvW/mAk/C2q10C44uC3QonDcN7XsX8vQB/dZIE=
Received: from BN9PR12MB5145.namprd12.prod.outlook.com (2603:10b6:408:136::20)
 by BN8PR12MB3203.namprd12.prod.outlook.com (2603:10b6:408:98::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26; Fri, 1 Apr
 2022 15:52:32 +0000
Received: from BN9PR12MB5145.namprd12.prod.outlook.com
 ([fe80::fd7c:84a5:85a2:3f70]) by BN9PR12MB5145.namprd12.prod.outlook.com
 ([fe80::fd7c:84a5:85a2:3f70%3]) with mapi id 15.20.5123.026; Fri, 1 Apr 2022
 15:52:31 +0000
From: "Zhang, Dingchen (David)" <Dingchen.Zhang@amd.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH 1/1] drm: add PSR2 support and capability definition as
 per eDP 1.5
Thread-Topic: [PATCH 1/1] drm: add PSR2 support and capability definition as
 per eDP 1.5
Thread-Index: AQHYRSSVtrYmanwfy0yJ3YA43QpG7azajUYAgACoraY=
Date: Fri, 1 Apr 2022 15:52:31 +0000
Message-ID: <BN9PR12MB5145FAD4E003F5E226B4E9778DE09@BN9PR12MB5145.namprd12.prod.outlook.com>
References: <20220331172652.3445223-1-dingchen.zhang@amd.com>
 <20220331172652.3445223-2-dingchen.zhang@amd.com>
 <6b01c237-c58c-26be-0f6a-2bdef452faa2@molgen.mpg.de>
In-Reply-To: <6b01c237-c58c-26be-0f6a-2bdef452faa2@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-04-01T15:52:29.757Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f714de49-209f-4fa9-2f88-08da13f7a1bc
x-ms-traffictypediagnostic: BN8PR12MB3203:EE_
x-microsoft-antispam-prvs: <BN8PR12MB3203C786AECC2BE07AD5402B8DE09@BN8PR12MB3203.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G5EVkZCfIYLdsJpxZ/TtXAlePdcQW6ttyiJxu511BwpP24GAYDvSnU7tzcg2x1/jUl4WQl3EdQiSR8BAUEWLR8Yqb/fNWy7/ngqq5jnV70OKiij9TKnYQWCIrTkJv7zenpIJqqoYO3GDYIDOdOXKITYxQnfX6BYYCQlXFmrj3A/ZcwETentqctFRMAK9P8CmVNTAC+wej4ngo92VfQh53GtSS5cJnbySZ7QtkMUEuOJol4gCW7qQxYlZPY/wmF+06VxO/B5P8BiUaMgvkAMU7rM0FK85FxGw0oIFW3sarTuN2BFmMkjC2HO2G+A7jyodtm8XIEwnLLvPIcyUfydZRZYDXuYdfRPwInsziqKlzCNM/eeBw4C1mD6lfpuk1NXjGmPGzwJGWZlLFACNkLYSWr9Z5ukOsQsCCB8Abig5lFma1ukbId2MRue9mJbSeuMt04rFBYuCgKDP7Ng9YJu8wxWUUAXVShLUVvxXMHb2qmirRMelVTWTvl58SZBKntk7G2uN0nqw32Xopno76oA8Zz61XvzR66C52rNyzThMwxdKtndXa/A3sqJDmiyCpwuZOXaN7C2RPYgxYFiVuhBJW75cEKFYlwGND/8MfsKkmgi65ruugMZmhN1jNxEMCAQ1vk4QHWQ6jMtTecP1jCVoPnZByrSfMbdXj2dwY3brFM6Sxly3AEejJp+ylQ4yVVo5aQF1O6MIQhSclZo4rRaHV9t6mL5wzruYCbVO4MfHOU0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5145.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(122000001)(38070700005)(8936002)(6916009)(54906003)(71200400001)(508600001)(5660300002)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(52536014)(316002)(91956017)(186003)(26005)(83380400001)(66946007)(2906002)(76116006)(6506007)(7696005)(53546011)(33656002)(9686003)(55016003)(86362001)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sxxoZ0R6+upUb9vbKkIAafdzwG1Bx0CAgt/ADw8JPu/bhg/P1BoXdNjJKS?=
 =?iso-8859-1?Q?Fx57r6Gyc6fthDUfFFsulUbpJv+0SfK5LS6jeTbqBDHUQz65Q+UrfgozHn?=
 =?iso-8859-1?Q?os/xuEVrCPqWWPh+wOhkfN4mna836a4pT+fbY2zoL6EphxfHMLEQug6wJG?=
 =?iso-8859-1?Q?1jH+hKcrLnxVkxzbW6UwxWUVJezF9YYwpnxWohUvsKUQ6lpVkQo88iWh2C?=
 =?iso-8859-1?Q?oz059dxIRLEItSyn38J6NmARbjFN4BepZAWQn5pT//+M9Tto7Vl+VpOeTm?=
 =?iso-8859-1?Q?jgDETTkiQoPqrPDNQQpj/1TAZY6KB8kz8tfiLIJLep9b3jtkPVdiM95fG1?=
 =?iso-8859-1?Q?tLMJjrG8hoNdsd2kb4Yd2LvTuguQL4imJwbmzYB+iIbiJauZHjWsMX6q+u?=
 =?iso-8859-1?Q?rlNnlFcL1lv0mja5AxlhYnO/c65758qrORw83gOpfL47UBVZOLasG2rRBH?=
 =?iso-8859-1?Q?sFQLMAxeIjVX0HFNepQjcrZu4imHNsboBHQ/WB2qSkv+InsskvVmyoCH2E?=
 =?iso-8859-1?Q?Wa5CG6XHQ81G12r8gwnNbVYblBfSNJ3j5XPDEP3mSj+IG2EeQ9kRPYRtdp?=
 =?iso-8859-1?Q?Jle7mSV1qHjUIfRXidEAT80zZzRXt2MOeb3VU+w1vFT85M00EvjZrvxDph?=
 =?iso-8859-1?Q?lWXHTWIDDxBfOsQgy4QsE297ynRl81pmZrqtEI3MrGEvo8lbnKJ847EbBP?=
 =?iso-8859-1?Q?QWtJXYbvrhrTh1MrGoZemnZZMAaKw4PInaVpXIQ05S79wcd+86w8jJVNgG?=
 =?iso-8859-1?Q?wcIAYlei3wUeGB9LKHZOgWVCEcalhs1gciQKbNL/2Yua1BoImJVU4lRMtH?=
 =?iso-8859-1?Q?oEAEijkVmbJ9RksVT4Lw+vOERyz5hZbLzB4FiCg3LYwntZnj0VLq5wDrYI?=
 =?iso-8859-1?Q?KsBsJ1atCVMH8b/CLqgIWANdVA6RSfWD//4lhE/3NIu/pHTqhYwYIAJ7FT?=
 =?iso-8859-1?Q?7eeFehosvPdOlM66IB9rHh3qJMRzd/Z1oXJwYkXWwJ6YLAuKd+MbBlaJkT?=
 =?iso-8859-1?Q?lpmOUGyPHtfQDvBOHvMS+yc1AafxpfF4RWkj/qYrYQDPbxFnd5ur6FpyYu?=
 =?iso-8859-1?Q?rma8f1pfUY8bZCGDCjip8frvtZe+eKrUDmbzHnvc3lyLzHKUCCfc96qeQ4?=
 =?iso-8859-1?Q?GsqBLMGhhSCmkhGCx/Qf1fcY3cnEqd7xUR4qCjhf4JKYnWZHo7rxRUHyEw?=
 =?iso-8859-1?Q?nIBdaFkn9HxwRjDkBPoRGEEH4pvTuJIh+L0A8mb134O5CWnv6uoNOhnXWy?=
 =?iso-8859-1?Q?saUVgJQ7Zsj23MXmqWUpXpEeONILLoQPiaTxNsOdsMu1bkp3smYlrQOJEk?=
 =?iso-8859-1?Q?eFa01T7PJn7aOzK7HW875JdqKrcA/IzuDufFkc90uICVd05HRB+jGh8bsn?=
 =?iso-8859-1?Q?pE/dCN0BWM/XftiCAOzj65lYayYtMpj8UKemZEVbBLy+fSTZYXNx6qJMo8?=
 =?iso-8859-1?Q?SOcF9W35fyl0IirBG3m0TcfRktGTO4aAt+82r/0nNO/V43Ooloog9Bhdbe?=
 =?iso-8859-1?Q?3ngNnbKM8eF3UGRa19fjC1XZeC8hzpKv+tatG96VeO7ZcGqsDsJSjaO6s8?=
 =?iso-8859-1?Q?vXOHZARQmUI6GYrxRUNr/tiKkNeCs2xtFpiP/LSAhkcLQ/HDLp+oiQonhw?=
 =?iso-8859-1?Q?P0qEAmmfPYhU5/ebV0FwBSThEJsrWItG+XHhVx2kqBxpJmAra43O+IVdzd?=
 =?iso-8859-1?Q?zw52Dcyp/n2OBvEAmJV4KAzRJN3FjpLofdasr/2D/ZA2jfjEb68n+9YMg0?=
 =?iso-8859-1?Q?3olHstn1IcfuhMeLn24BprPr/xwo0h8j0Hs47bLFxGIspo?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5145.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f714de49-209f-4fa9-2f88-08da13f7a1bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 15:52:31.3115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FX25T2Gd+faAbxKN4MmPZ/Njg9UAQWoR6byYABo76JKGNZdXBhVlqU/4n2arnA45io8eIwRUsebL+EfMRgJzmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3203
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
Cc: "Wang, Chao-kai \(Stylon\)" <Stylon.Wang@amd.com>, "Chiu,
 Solomon" <Solomon.Chiu@amd.com>, "airlied@linux.ie" <airlied@linux.ie>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Zhuo,
 Qingqing \(Lillian\)" <Qingqing.Zhuo@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, "Li, Roman" <Roman.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Zuo, 
 Jerry" <Jerry.Zuo@amd.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Lin,
 Wayne" <Wayne.Lin@amd.com>, "Gutierrez, Agustin" <Agustin.Gutierrez@amd.com>,
 "Kotarac, Pavle" <Pavle.Kotarac@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

Hi Paul and Harry,

Thanks for reviewing the patch and commit msg has been revised as per your =
comments in the v2.



From: Paul Menzel <pmenzel@molgen.mpg.de>
Sent: Friday, April 1, 2022 1:46 AM
To: Zhang, Dingchen (David) <Dingchen.Zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; Wang, Chao-kai (=
Stylon) <Stylon.Wang@amd.com>; airlied@linux.ie <airlied@linux.ie>; Li, Sun=
 peng (Leo) <Sunpeng.Li@amd.com>; Wentland, Harry <Harry.Wentland@amd.com>;=
 Zhuo, Qingqing (Lillian) <Qingqing.Zhuo@amd.com>; Siqueira, Rodrigo <Rodri=
go.Siqueira@amd.com>; Li, Roman <Roman.Li@amd.com>; Chiu, Solomon <Solomon.=
Chiu@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>; Pillai, Aurabindo <Aurabindo=
.Pillai@amd.com>; daniel@ffwll.ch <daniel@ffwll.ch>; Lin, Wayne <Wayne.Lin@=
amd.com>; Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Gutierrez, Agusti=
n <Agustin.Gutierrez@amd.com>; Kotarac, Pavle <Pavle.Kotarac@amd.com>
Subject: Re: [PATCH 1/1] drm: add PSR2 support and capability definition as=
 per eDP 1.5

Dear David,


Thank you for your patch.

Am 31.03.22 um 19:26 schrieb David Zhang:
> [why & how]
> In eDP 1.5 spec, some new DPCD bit fileds are defined for PSR-SU
> support.

You could be specific by using the exact number two. Maybe:

As per eDP 1.5 specification, add the two DPCD bit fields below for
PSR-SU support:

1.  DP_PSR2_WITH_Y_COORD_ET_SUPPORTED
2.  DP_PSR2_SU_AUX_FRAME_SYNC_NOT_NEEDED


Kind regards,

Paul

> Signed-off-by: David Zhang <dingchen.zhang@amd.com>
> ---
>   include/drm/drm_dp_helper.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 30359e434c3f..ac7b7571ae66 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -361,6 +361,7 @@ struct drm_panel;
>   # define DP_PSR_IS_SUPPORTED                1
>   # define DP_PSR2_IS_SUPPORTED                   2        /* eDP 1.4 */
>   # define DP_PSR2_WITH_Y_COORD_IS_SUPPORTED  3           /* eDP 1.4a */
> +# define DP_PSR2_WITH_Y_COORD_ET_SUPPORTED  4            /* eDP 1.5, ado=
pted eDP 1.4b SCR */
>
>   #define DP_PSR_CAPS                         0x071   /* XXX 1.2? */
>   # define DP_PSR_NO_TRAIN_ON_EXIT            1
> @@ -375,6 +376,7 @@ struct drm_panel;
>   # define DP_PSR_SETUP_TIME_SHIFT            1
>   # define DP_PSR2_SU_Y_COORDINATE_REQUIRED   (1 << 4)  /* eDP 1.4a */
>   # define DP_PSR2_SU_GRANULARITY_REQUIRED    (1 << 5)  /* eDP 1.4b */
> +# define DP_PSR2_SU_AUX_FRAME_SYNC_NOT_NEEDED (1 << 6)/* eDP 1.5, adopte=
d eDP 1.4b SCR */
>
>   #define DP_PSR2_SU_X_GRANULARITY        0x072 /* eDP 1.4b */
>   #define DP_PSR2_SU_Y_GRANULARITY        0x074 /* eDP 1.4b */

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7573A14E3C0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 21:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498C16E8F6;
	Thu, 30 Jan 2020 20:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680063.outbound.protection.outlook.com [40.107.68.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ACA6E8F6;
 Thu, 30 Jan 2020 20:15:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W01azpWc+UR2u3hO5vSm0s4a0JlHCHA94MMhLbSmoxcQ8Yf24J0NWWfLX+wJ+Hqvgvn1A6/Su0Bx+eqzTyOJegdPhmf519fde42Wljqg4H3hvTZJ/U8SEFP3ATfqCzdgt6hpn4/MltHGwKZfjXq8lnh9xnSqarnmIPqfSohjXC+ITKl8km5CAwzg6tODyTTgwZJ9ny6+tqXa7CHZrt1BzstLUAUGpB51FFG1sjMmYlSqx7pzIzV/z5cnmb60dY3kTuTPWkZvdTOblNbmR8JRDkpSVOxImNSzpNOiPOcgHsronntg5ooJGXuYq7EdWthGudQDSR8ZTrJdlvVKmeCgMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXc1RdU/7fBqq0TlM3lWEh2kn2GAUDwiEBFGPxi1eEg=;
 b=bDv2txEew6+sDvJGZC82FqYGzUNyJ+72WVkgpJHvshpffPF5lYG6W2r4bftIsmrP/3QLgw3bbenNNmRCwFnifqsz29BQB3pvRVZy4JPVl7Srx3mBvxFsDdIpBY8g9bSm/2u9hxCpZv1jclqsdpY7jJWQ/8Zrp/2px8fYm+pHoIv5Sz3MkbRZWIX1dGv5u6YWVwOSqT6e8Hd2/8hABveseVcFXNS3i2J7VquFlhsb94TTdAo4ppY8jFJus/HqyqDjxDuTGvcKvdKru/BZIVXKYARf8BrV/YPGbzt3CFAs7NTRyH0zyJDsWkOpiR/4KtI736klPCeeBarO2kvlSif5yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXc1RdU/7fBqq0TlM3lWEh2kn2GAUDwiEBFGPxi1eEg=;
 b=s8wHs1ThSywCXMPlXO+cgvoIRGorrvsYcG+Q3J5Q9u4+JzOBMa0fgHK2m5OpX6UnGcmQf1cyO5pKWG8WulgmPRf012E+jrcuz9cxOCiCfw2gRdskPg6qpZNzqwOZQvfn8+U4z1XQqhZ4/k7NYDMPocE9IP3mT/DrmUpTfR45K2Y=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0165.namprd12.prod.outlook.com (10.172.78.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Thu, 30 Jan 2020 20:15:26 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f%9]) with mapi id 15.20.2665.027; Thu, 30 Jan 2020
 20:15:26 +0000
Subject: Re: [PATCH 6/6] drm/amd/display: REFERENCE for srm interface patches
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, harry.wentland@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexander.Deucher@amd.com
References: <20200122210548.2647-1-Bhawanpreet.Lakha@amd.com>
 <20200122210548.2647-7-Bhawanpreet.Lakha@amd.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <c0c8c197-1e23-ea89-5037-8f0043f1958d@amd.com>
Date: Thu, 30 Jan 2020 15:15:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <20200122210548.2647-7-Bhawanpreet.Lakha@amd.com>
Content-Language: en-US
X-ClientProxiedBy: BN6PR17CA0029.namprd17.prod.outlook.com
 (2603:10b6:405:75::18) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:9240:e3a::2] (2607:fea8:9240:e3a::2) by
 BN6PR17CA0029.namprd17.prod.outlook.com (2603:10b6:405:75::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20 via Frontend Transport; Thu, 30 Jan 2020 20:15:25 +0000
X-Originating-IP: [2607:fea8:9240:e3a::2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c6c1ff49-7767-4d84-9ec8-08d7a5c124bb
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0165:|CY4PR1201MB0165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0165CEAB1EB7F293498AF4EE8C040@CY4PR1201MB0165.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-Forefront-PRVS: 02981BE340
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(189003)(199004)(6486002)(16526019)(8936002)(186003)(5660300002)(478600001)(8676002)(81166006)(81156014)(36756003)(2906002)(450100002)(31686004)(66556008)(53546011)(316002)(66946007)(66476007)(52116002)(6636002)(31696002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0165;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FI+FNVxvsZIa5GdqI7m+Bx3RQE51SHiSeZxvwmQrrAXnSdhvLsPJ7gyiegsGDPkza4G902qVepzvawrngDNIUM2NcoaFmtVVe/CVhsRjCL3fL+RNrZ9hfl+PS3GhtB72/sbm7TLkBMMY6aWjuuDDKcs1TA3v5nqB9EHMCihhn7lG/UQ1tClhjcHR93nlC1MwqNyBWPH0sgjEo7Ckw9r+0IskD4a5oWPZ3LOmBDFCdg/pn6v5m9e8WBbunVrEer78+x5LyjQ5IQg1n8hqU3JYG+gbjmoLvaXJjWBphP1IU8TwBLX/Ac31aBFKK2+/XbP3F9FwlriJ8fvVod9BDOadsKX9JeUufNAwYjmez5no9M4emreCplbLFnajUUKHzopFZPSqiQ/Sd6+BgPFXpssQU0EOVEky87Aj3MJSvZY4DH/JEiaWGrT/9gLeBDrlqNIH
X-MS-Exchange-AntiSpam-MessageData: gsXGx31L5HtlbuocsPJP6/5qQ5hQcpfkvNlE+5BY7JSYR0p2zi0qOEXnWssAgdPk+jUQ5yg2HTBS+vD68d/v1PjTgpAfcpjiPEW+8X2BcebHAle4pmHslVo531NGMqsIXO899KF4qZcilsbEIw+rg/oq1CTpbFN5OBun6M/rDM4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c1ff49-7767-4d84-9ec8-08d7a5c124bb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2020 20:15:26.3579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8w4cbOEJVZeqGUi2DCGVfnRx80PONvjzfuBPz3WpyTeSPcXoccsZR6DYRblFGtrKx3JZDC1bAz/MnFY9ZUfg8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0165
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for providing more documentation and this reference.

The patch set (1-5) is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

On 2020-01-22 4:05 p.m., Bhawanpreet Lakha wrote:
> This is just a reference for the patches. not to be merged
> 
> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> ---
>  REFERENCE | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 REFERENCE
> 
> diff --git a/REFERENCE b/REFERENCE
> new file mode 100644
> index 000000000000..2e53f9cc82ff
> --- /dev/null
> +++ b/REFERENCE
> @@ -0,0 +1,49 @@
> +SRM interface Reference Usermode scripts for ubuntu. 
> +These are just reference sciprts to facilitate the SRM interface for amdgpu.
> +
> ++-----------------------------------------------------------------------------------------------------+
> +| Main script, this is called on boot/shutdown/suspend/resume , it calls the sysfs to get/set the SRM |
> +| FILE: /home/amdgpu_hdcp_srm_script.sh                                                               |
> ++-----------------------------------------------------------------------------------------------------+
> +#!/bin/bash
> +
> +SRMFILE="/home/SRM"
> +sudo cat "$SRMFILE" > /sys/class/drm/card0/device/hdcp_srm
> +sudo cat /sys/class/drm/card0/device/hdcp_srm > "$SRMFILE"
> +
> +
> +
> +
> +
> ++-----------------------------------------------------------------------------------------------------+
> +| .service file, This is placed into /etc/systemd/system/ so it runs the main script on boot/shutdown |
> +| FILE: /etc/systemd/system/amdgpu_hdc_srm_boot_shutdown.service                                      |
> ++-----------------------------------------------------------------------------------------------------+
> +[Unit]
> +Description=HDCP SRM boot and shutdown save/load
> +
> +[Service]
> +Type=simple
> +ExecStart=/home/amdgpu_hdcp_srm_script.sh
> +ExecStop=/home/amdgpu_hdcp_srm_script.sh
> +
> +[Install]
> +WantedBy=multi-user.target
> +
> +
> +
> ++-----------------------------------------------------------------------------------------------------+
> +| To run the script on boot/start run 								      |
> ++-----------------------------------------------------------------------------------------------------+
> +sudo systemctl start amdgpu_hdc_srm_boot_shutdown
> +sudo systemctl enable amdgpu_hdc_srm_boot_shutdown
> +
> +
> +
> ++-----------------------------------------------------------------------------------------------------+
> +| To symlnk the files (adding to these directory will run the script on suspend/resume                |
> ++-----------------------------------------------------------------------------------------------------+
> +sudo ln -s $SCRIPTFILE /lib/systemd/system-sleep/amdgpu_hdcp_srm
> +sudo ln -s $SCRIPTFILE /usr/lib/pm-utils/sleep.d/95amdgpu_hdcp_srm
> +
> +
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

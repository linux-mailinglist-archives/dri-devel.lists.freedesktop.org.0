Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EA6A7E077
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 16:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6B610E47F;
	Mon,  7 Apr 2025 14:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazon11021104.outbound.protection.outlook.com
 [40.107.51.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D6710E47F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 14:06:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ws1tzb/TuN2cIa2/YRYHCjrC2JSIrjwIuX3lPIPu7S1OJmGqWefJHGeTrsIGs84VCsHNECTV4snYmiGZiUkIYxO7bC5Zsovoz9v+a1uDuokQ7H7ZSu2Fe8RgTlXwVB2JPrq5Wf1X8/JGlE82PVWeX1Wx8sLW/r1ZIu+VgvQ5f1oz3va0/77NlgaVwAR9XqFkaHAfULv4K1dPNxtlIT1wHCAkBbACeZz5gKqoBDfx0wMF7JSVTZayQfRtbdLNw9D3B39kgX04S9w4QhkytxjfUIJwKmLoAWOz87+x1/1kGyZU0i1dcNxJek09GB7pzrJL53+Yw8KL55/FAinanS9Skw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3QrI7uzPdWQttr1rK3K0jR2sAzqjyaYBGx6y/fKmio=;
 b=yPFfU3L7A5OiC5GQ837zYlpOa7ermqQPV082xrWwDk/lNJWrI4b8vXBpbvpn42fyvram7if413P6s9Jy9zdq9COaYlrC9B0YHG7vtdNJ/P2r14IX0e0+fVBN2oimucXl8ScLxOOSTMfIVnCgrjTHOuucNUH04/q0GVk7pX1Ehcxa/psvHSIIDgw/Q2WllQeaOZre1dzvBvw/9AmzXGu0Jib6wEUv085Lo2WrVipFp+0v+F7QMar8vOVYc19IQ81oidOzGE5+3vn+P1E8oozwi38ovGggsfFRQgENGmXKDa/9I58Ca6ALmcWm/7JZl5XOhUdAWKXFwGYAMssBSUtG0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1279.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 14:06:35 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%2]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 14:06:35 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: Need Help Enabling HDMI on Debix Model A
Thread-Topic: Need Help Enabling HDMI on Debix Model A
Thread-Index: AQHbp61bJ8rSy9+zQkebTS5KwgzRBLOYK2mAgAAM5vM=
Date: Mon, 7 Apr 2025 14:06:35 +0000
Message-ID: <PN3P287MB1829692B4C3D5AD273CB62DE8BAA2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <PN3P287MB1829E84B6B79E9C7189D7CB78BAA2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250407130257.GD3924@pendragon.ideasonboard.com>
In-Reply-To: <20250407130257.GD3924@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB1279:EE_
x-ms-office365-filtering-correlation-id: 249c2875-4c01-46a2-0103-08dd75dd6862
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?Windows-1252?Q?4ttF5B16HrhxsvhJ0vXy3a5dY+kpvXAX7/65Fqj+ohM1FvMcUUVtLs2y?=
 =?Windows-1252?Q?g86WNm/sQDRgSYFZ/5VJl0WkNFn3iQGAoDOD0GJGQjw7O7TkM/iB2MRe?=
 =?Windows-1252?Q?cg8P7BiHkVU3QRQCdNlHXOd9oUainvbiHshB3APuVIFb1ChHKn7Jaaky?=
 =?Windows-1252?Q?PxJ3it6XnSuI2h7obYmw+zeFDydMOcczrRbz1t0NFrI+AvZjes+T+ZkB?=
 =?Windows-1252?Q?33w4iGPwqqLK1Cr0SHSxDdehk10wQjQJwIKw9Qfw26Dw7ExaYC/8bH7W?=
 =?Windows-1252?Q?uKZg8sgYyQSDGIh86Qs4mI5WqWlOPBNOWM58EXKmZfi4ATOG5QF5FiH5?=
 =?Windows-1252?Q?JajBkP1C5n7UHkNiE7zZC0c0f6kEMzn7qsbi+3seX+qX21mmPsV0f2p5?=
 =?Windows-1252?Q?Ef9BYb97B6gu7MW6oefRPMeUfZuQQtS30kOhtOswcpn1y4Kbt7wZb0IF?=
 =?Windows-1252?Q?fwgHXKPdlrIz89FWnuScEjcbdpNNS5TqvdvsulqnNS7xuXQRGBl+QMXd?=
 =?Windows-1252?Q?dXjvAPfmRTMVaz+SK0d0uGjvfeXNKc0ve2OlzNvyEkBokK1lALoWLpWO?=
 =?Windows-1252?Q?bJsFWNGAHG+vBrGUz4PgPaneWgWg/j+cty2NvPNSI+n4xZO/4cdc6Uhk?=
 =?Windows-1252?Q?3msDOR277dJ3Y0/q/bqgmL1Ts5/hH+C5WD2hzrA9Vdh6oTuxtf8h0L5H?=
 =?Windows-1252?Q?33k6TyCSgaOh0C+cz//PYbzTDGXfSDdp+gQ3ZSuwjYY5YoXtzT+l9/bn?=
 =?Windows-1252?Q?QOhO6i34acKz1/t1V3ofaO2s9aAlIVTg1K7FtFJSJPIK7XSOMs6w62lX?=
 =?Windows-1252?Q?im+6NvKHdjt/VViGLh47T3moB8x9kaEFjtcIof8u08c18LvNppzrUWUu?=
 =?Windows-1252?Q?W9JxFZTcO2yqCR/Ylw4GQG8/TSRXO6MAEAMrr+nMWu/ptwg9YQJaaO0r?=
 =?Windows-1252?Q?bDSZqzpVmJRuGneZ68B5V8b+1lsrdp1DadrasAdotuZIesiB4PSB6Kbz?=
 =?Windows-1252?Q?cMRt7N2sVc/XBjmat5EWbeKx/mTToU8JAidCMfsS7s4LdUrvaihlCqO8?=
 =?Windows-1252?Q?RB8nmETgFqMctaDpKLvntzFxhITO6R9FwVBQECebrX+pukAqY2RlQypd?=
 =?Windows-1252?Q?LpvRd9St74x2OVD9QcD3+YQ1N4TALRga+yHGxieLnoWMShV0EG7P51Ol?=
 =?Windows-1252?Q?iilcHoE4KXd+FJ69UiQGT/JzMzYSVTWBfUhF4S+JB9hssVh699sxKM5h?=
 =?Windows-1252?Q?nkPx2heFRcXMfiGqEKosJG2ngzDCdUu0R1tA0JlUmjWBZkgLsMvX13KL?=
 =?Windows-1252?Q?4aXkg3cbzbqNCAXWquLUir8ZuZI+wBA/NaulnYkKOT9AeWuuUezLhuVu?=
 =?Windows-1252?Q?VHorVKJHxvydkaL72ZdPtSRlzGUN4NPbC36c/0xqy/ecfPz4WiseH3w9?=
 =?Windows-1252?Q?n7fS/M7hChCwJrpPySwGN64+t2bSXKUex5xywjPMKfsRSIDBNbEPhES9?=
 =?Windows-1252?Q?5uPY6cCXCa0F6mVq6d4i9iOiTxHoOcR8+aLnWW4LxCDeajtiMEIDpvtm?=
 =?Windows-1252?Q?ou3cbhn2KMCmATXJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?03B1ZR7w5wQXaNO4DEaY5Y5DmStDaNlNJyuncCM8SSiZnxfD3m6WVeQ1?=
 =?Windows-1252?Q?RVze4X33Va29Ncy1d07C/lpuxxQqi/Se3xhQo3EqcwR/Gz5LCZJ4xURI?=
 =?Windows-1252?Q?8QBevRJKV6yc8esQQejxwpC4G3FlXdeGLASB6Rc/tgyh6eAzPlNm6DLn?=
 =?Windows-1252?Q?Eei7mSF+CoSOqShOqOihFCaBUp0gSiKeeCRuqGiFgSsgaigjw0XRN9B/?=
 =?Windows-1252?Q?iDYWELlQ2u0h78AQXeFLuwSDKzXSxPPSBOqkVDiiS2fwNVU1r3n/STu9?=
 =?Windows-1252?Q?aLKk/DOHxfVmb4CCdO6LDh5CXfZoGktyiLHBuxt0wdBrqq9aw9xu8ss+?=
 =?Windows-1252?Q?GWcJpkxPNocmfzElddiqMvMyl+FyCqnexH9KzfsWzFsQok45jC41Yu2U?=
 =?Windows-1252?Q?DSwdsoMa3DiYIAHDBc2e7uQOMWys974vCTGcotVgxYkhoZ3qmz8Y1SkF?=
 =?Windows-1252?Q?J+jTiQ43a4wOeyXiNfI5YZxMeIrSVa1C16L72x5dscVeKtWRlUPMGL5l?=
 =?Windows-1252?Q?L8pPd2T7/XYhPOxzGMbJr5YmjCoCLbmRiTTafPeY/K8wZsczCuOXY57F?=
 =?Windows-1252?Q?JVMHhQAJ/rFjw/20w3ZhBEsEpjE3w5mVEBK3jDWyXcQpXameCbacHBRN?=
 =?Windows-1252?Q?ZzP8fT3NkAmymvjN3KJDPGU9ZTpIG0+w7595KxxQoOYEL49zDCCfZJYk?=
 =?Windows-1252?Q?c69/1Kd5udfYu7/9BLKi8BqefBtjRbEtY5l0kWaNfchY56Bawumeq2wo?=
 =?Windows-1252?Q?AKtKEBdMSEnNcJHzVjvf7/gbPAv9Bb38j0rnQTfvVQndBd3wS4ObHFV9?=
 =?Windows-1252?Q?i6MOH+JgHhAuHFSVVqosuO1s9/8DllYxtgVaKhh28A/I+u/HHoT5lS/L?=
 =?Windows-1252?Q?s3tv6Z9zDTFhy4by1O7nig4q79LD2RVsis5Z4BxNJ8L+sZQzZczCPaX3?=
 =?Windows-1252?Q?NQhyF2c5HNIEpLAuUpcxJPpaRoN6Am/8hP4eEKH/tSUqBiQ9+vZ5p8Gy?=
 =?Windows-1252?Q?8UXeEsYRTUAXA1L4VvnEo6MrCI3S9SYe37j38jzrGcm1B6Of1kiMX8wg?=
 =?Windows-1252?Q?37pUbWAaQ9Fz1A+gBgnLjSLoS7E9HbOpjNoqD8gmU0xnYowLWl2Zt/Vx?=
 =?Windows-1252?Q?mmTfljF4IG0UvxAUKV543FenuJsLNTaiyhNx0CHjwyjuFiHXaFmKbKqB?=
 =?Windows-1252?Q?PDCNcM+Keg0LGO4XI0L0k/bobsx3hBypzX+1ryMou/z6KtxxbOG9zYhj?=
 =?Windows-1252?Q?zKjXqI3c688IFiTrMBoF0zMsYHFihccgYrzHyssCBb6PbQ08cdaXAr4l?=
 =?Windows-1252?Q?Jc9a5bXNw0INNRd3RbSr087ft9A5YncUmluJxnRT1oE55WAj3b2Kid0o?=
 =?Windows-1252?Q?ICgK7dZcE2GQ5AUVS3U8Pln8zK6LFOMfbwfmBwmUlcekk8weVhwTkn6K?=
 =?Windows-1252?Q?UqyC3Hf8Jn3dWtE+Q7ISuHmI0HGBqJxl9I+ggZUG+ry2925mHlk+dZRx?=
 =?Windows-1252?Q?F/AgHHEm8Yoz00s3IdAu5KsBcdm9JEWD/pbPnplR1WkRCbfkK1J6+kjv?=
 =?Windows-1252?Q?MNwwTuZ07NBPlVDfCMgPJwHSt5RmiAlKXoGBPXuul5EQ+Xv96x7ztDgY?=
 =?Windows-1252?Q?Mo2sGlkOz6ETDCFAlDBZIx/ur6ExN+28/yHSu7PiTJvwU12SehzFU1sL?=
 =?Windows-1252?Q?Rsz+jKBEWR65kp2FNqrP1W4jocwOI34wbgJa/0a2gvO3bd/QKvpB4w?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 249c2875-4c01-46a2-0103-08dd75dd6862
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 14:06:35.5692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L5hdIxR27/XeJ8m7uzEt6zYgjxoy35eTzKz7G2K6/k0QCYEIBC+g1eDK+4AG2poTH0XeVL68mOlC9oLGyLKGNCebP23tcyUGQHv6H7ygA20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1279
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

Hi Laurent,=0A=
=0A=
Thanks for the response.=0A=
=0A=
> On Mon, Apr 07, 2025 at 11:10:23AM +0000, Tarang Raval wrote:=0A=
> > Hi Laurent,=0A=
> >=0A=
> > I=92m trying to bring up HDMI on the Debix Model A board using the=0A=
> > mainline kernel, but I=92m currently facing issues.=0A=
> >=0A=
> > I saw that you tested the patch for HDMI support on this board in=0A=
> > mainline, so I am hoping you could help me figure out what might be=0A=
> > missing.=0A=
> >=0A=
> > To clarify =97 I'm using the prebuilt image provided by Debix, but I re=
placed=0A=
> > the kernel image and the device tree (DTS) file in the /boot directory =
with=0A=
> > ones built from the mainline kernel.=0A=
> >=0A=
> > I=92ve enabled the following configurations in the kernel:=0A=
> > CONFIG_DRM_DISPLAY_CONNECTOR=3Dy=0A=
> > CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=3Dy=0A=
> > CONFIG_DRM_IMX8MP_HDMI_PVI=3Dy=0A=
> > CONFIG_DRM_IMX_LCDIF=3Dy=0A=
> > CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY=3Dy=0A=
> >=0A=
> > When I boot the board, I see the following HDMI/DRM related logs:=0A=
> > debix@imx8mp-debix:~$ dmesg | grep -iE "drm|hdmi"=0A=
> > [ =A0 =A00.121979] /soc@0/bus@32c00000/display-bridge@32fc4000: Fixed d=
ependency cycle(s) with /soc@0/bus@32c00000/hdmi@32fd8000=0A=
> > [ =A0 =A00.122164] /soc@0/bus@32c00000/hdmi@32fd8000: Fixed dependency =
cycle(s) with /soc@0/bus@32c00000/display-bridge@32fc4000=0A=
> > [ =A0 =A00.127417] /soc@0/bus@32c00000/hdmi@32fd8000: Fixed dependency =
cycle(s) with /hdmi-connector=0A=
> > [ =A0 =A00.127608] /hdmi-connector: Fixed dependency cycle(s) with /soc=
@0/bus@32c00000/hdmi@32fd8000=0A=
> > [ =A0 =A01.947962] imx8mp-dw-hdmi-tx 32fd8000.hdmi: Detected HDMI TX co=
ntroller v2.13a with HDCP (SAMSUNG HDMI TX PHY)=0A=
> > [ =A0 =A01.949220] imx8mp-dw-hdmi-tx 32fd8000.hdmi: registered DesignWa=
re HDMI I2C bus driver=0A=
> > [ =A0 =A01.956365] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.displ=
ay-controller on minor 0=0A=
> > [ =A0 =A02.016601] imx-lcdif 32fc6000.display-controller: [drm] fb0: im=
x-lcdifdrmfb frame buffer device=0A=
> > [ =A0 =A08.380915] systemd[1]: Starting Load Kernel Module drm...=0A=
> >=0A=
> >=0A=
> > I also checked that the display's modeline is recognized under sysfs :=
=0A=
> >=0A=
> > root@imx8mp-debix:~# ls /sys/class/drm/card0-HDMI-A-1/=0A=
> > connector_id =A0dpms =A0 =A0 =A0 =A0 =A0modes =A0 =A0 =A0 =A0 subsystem=
/=0A=
> > ddc/ =A0 =A0 =A0 =A0 =A0edid =A0 =A0 =A0 =A0 =A0power/ =A0 =A0 =A0 =A0u=
event=0A=
> > device/ =A0 =A0 =A0 enabled =A0 =A0 =A0 status=0A=
> >=0A=
> > However, there is still no HDMI output on the display. Instead,=0A=
> > I only see a white blinking cursor on the screen.. I'm not sure=0A=
> > what I'm missing.=0A=
>=A0=0A=
> The white blinking cursor means the display is working from the kernel=0A=
> point of view. What are you expecting, are you running an X server or=0A=
> Wayland compositor ?=0A=
=0A=
I'm expecting to see the Ubuntu desktop environment on the HDMI =0A=
display =97 just like how it appears with the original prebuilt image provi=
ded =0A=
by Debix. I'm running the default Ubuntu 22.04 LTS prebuilt image, and I on=
ly=0A=
replaced the Image and .dtb file=0A=
=0A=
I'm not explicitly launching an X server or Wayland compositor myself=0A=
=0A=
However, based on your response, I now realize that I may also need to =0A=
enable GPU support in the mainline device tree. Specifically, I believe I =
=0A=
need to enable the gpu2D and gpu3D nodes to allow the graphical =0A=
environment to start properly and render the desktop over HDMI.=0A=
=0A=
Does that sound correct, or is there anything else I should check or =0A=
enable?=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
> > Could you please help me out or point me in the right direction?=0A=
> >=0A=
> > Thank you for your time.=0A=
> >=0A=
> > Best Regards,=0A=
> > Tarang=0A=
>=A0=0A=
> --=0A=
> Regards,=0A=
>=A0=0A=
> Laurent Pinchart=

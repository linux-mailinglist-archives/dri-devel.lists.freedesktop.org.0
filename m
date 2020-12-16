Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0592DCDC7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 09:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CB96E1B6;
	Thu, 17 Dec 2020 08:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27F089ADC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 18:26:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r7so24137992wrc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 10:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:date:from:subject:thread-topic:message-id:to:cc
 :content-transfer-encoding;
 bh=pucIXkWwRfuuTE89zfirdFKHyDQS4sBwok91EdDE6fQ=;
 b=LgvYLirFMXfALMUjAvOnUdCnAg2/HNGLlgUUMiaRu06+0XX5S6JfJ0cQ60cdmlIte+
 UH0b0C6BeeOdQj/XCxA7AL/wvmTAvGm0st95b4dxCjC8/zzqqff4ozNSjMlclukUrzFm
 HzKK0ojIAu+SvJ9uuU7kD4GaTmXvCESlvREOKiWLZhUvXMWB3vPnzzWg77jAyCO5y/7z
 8/p4r6VnFhKKgr7WPz0hxptZdeECHR+xwFe3aK/5FIuDL+AY6MK3WVtsClxKLKHYbI9q
 xX0Qf4nAeavrl8f0lYvWsFfenXFmkgwL2Z/KfZuK0OzCgCGb6ZQTcZdKi79GohP1gj6E
 IAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:from:subject:thread-topic
 :message-id:to:cc:content-transfer-encoding;
 bh=pucIXkWwRfuuTE89zfirdFKHyDQS4sBwok91EdDE6fQ=;
 b=XmBOaAUGIz5BL0oGJ4z2qycUzEFWpLSPRkLKUjdDG5JXbuVNdAvsfJhyd8Npta+3J6
 U139M642ivjcYHc/Agq1SuPD1wBwL/QLh8cYgGdResTkXfPulf4MXxjtoqwnACr7fLqi
 P7ikMTbZMz3yw5YPJb1hSjirRTAuSAPs+tBcaIT0gTwrAqRmDIWbZ56XiRlf56nbnFIv
 +FC4B72GCm4d1YMFYwjilT4VP/X28g8B8mgdeHhn0YIID8WM9vZiPxXDimLgMkMIMzC3
 8JsyqOKVsIQ+s13SM1ZasFjbmH7KeJ0EBL55DVt8cUDFFJn+qhzLqoD3b3yeNRRHUTCa
 Jurw==
X-Gm-Message-State: AOAM533OlGRvBw1LBLYJxG5IU32xx8prKYMjL2L+Znlg5w6KVPOJ7+8I
 5+Bf9mCkxDrH6VtUvWgkuYw=
X-Google-Smtp-Source: ABdhPJzhGyufAHVd7rJBaxtp1Y+Z1K0vg1+6JtEW02aU/EC6UjoqXUJFltE7ylA88IREIcsNNHonGA==
X-Received: by 2002:adf:db43:: with SMTP id f3mr8610496wrj.70.1608143196342;
 Wed, 16 Dec 2020 10:26:36 -0800 (PST)
Received: from SW-5PN9DP2 ([149.62.159.23])
 by smtp.gmail.com with ESMTPSA id 138sm4196912wma.41.2020.12.16.10.26.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Dec 2020 10:26:35 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 16 Dec 2020 19:38:24 +0100
From: Mathieu Tournier <mathieutournier@gmail.com>
Subject: Re: [PATCH v6] drm/bridge: add it6505 driver
Thread-Topic: Re: [PATCH v6] drm/bridge: add it6505 driver
Message-ID: <3F164009-1941-4980-A704-A35EAE3EDAB1@hxcore.ol>
To: "allen.chen@ite.com.tw" <allen.chen@ite.com.tw>
X-Mailman-Approved-At: Thu, 17 Dec 2020 08:43:32 +0000
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
Cc: "Kenneth.Hung@ite.com.tw" <Kenneth.Hung@ite.com.tw>,
 "jitao.shi@mediatek.com" <jitao.shi@mediatek.com>,
 "Jau-Chih.Tseng@ite.com.tw" <Jau-Chih.Tseng@ite.com.tw>,
 "airlied@linux.ie" <airlied@linux.ie>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "hermes.wu@ite.com.tw" <hermes.wu@ite.com.tw>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "pihsun@chromium.org" <pihsun@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "yllin@google.com" <yllin@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0682259230=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0682259230==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
pre
	{mso-style-priority:99;
	mso-style-link:"Pr\00E9format\00E9 HTML Car";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.PrformatHTMLCar
	{mso-style-name:"Pr\00E9format\00E9 HTML Car";
	mso-style-priority:99;
	mso-style-link:"Pr\00E9format\00E9 HTML";
	font-family:"Courier New";}
span.add
	{mso-style-name:add;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DFR link=3Dblue vlink=3D"#954F72" style=3D'wo=
rd-wrap:break-word'><div class=3DWordSection1><pre><span style=3D'color:bla=
ck'>Hi Allen.<o:p></o:p></span></pre><pre><span style=3D'color:black'>As it=
6505 is compatible with DisplayPort 1.1a,<o:p></o:p></span></pre><pre><span=
 style=3D'color:black'>Should <span class=3Dadd>DPI_PIXEL_CLK_MAX be 165&nb=
sp;000&nbsp;instead of 95&nbsp;000 khz ?</span></span><span class=3Dadd><o:=
p></o:p></span></pre><pre><span class=3Dadd><span style=3D'color:black'>Thi=
s would permit 1080p support, as it seems supported.<o:p></o:p></span></spa=
n></pre><pre><span class=3Dadd><span style=3D'color:black'><o:p>&nbsp;</o:p=
></span></span></pre><pre><span class=3Dadd><span style=3D'color:black'>Mat=
hieu</span></span><o:p></o:p></pre><p class=3DMsoNormal><o:p>&nbsp;</o:p></=
p></div></body></html>=


--===============0682259230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0682259230==--

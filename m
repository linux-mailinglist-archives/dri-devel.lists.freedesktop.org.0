Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E775E6DE8DD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 03:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439DB10E6CF;
	Wed, 12 Apr 2023 01:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 348 seconds by postgrey-1.36 at gabe;
 Wed, 12 Apr 2023 01:28:53 UTC
Received: from st43p00im-ztbu10073601.me.com (st43p00im-ztbu10073601.me.com
 [17.58.63.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD52610E6CF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 01:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1681262584;
 bh=5lYEMcGNaDjCakbfqg3dZSHw5YYijll0DV6pUU4IwUQ=;
 h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To;
 b=atT1omM/juMY7qst5KCgYsE6VaDU9lY5T+rr6QEqEViHM+OS2qQL8LwuyIe7a9Mpm
 1UBL2YqmM4xmqD/xSJfIzVz7PmkjxvSOBcEsoIE/UQkOFAcd/LfEee3O/9im9b1dnl
 4UracAxZZ8NNMIjFcgjL6IoYGD1Q9vQtqtsVPYRimlHooPEqc/HvIYMT9XTh+FkCQ1
 YyATazRM8rb1SN7g03dIXN1bdogviM+cFb/8W4WABoZjnaX1BKLUyQCUd5L2S8SpNI
 OAXQM8UUStujT1JHMzhmsklmNMW8eDRshhkwvMMnRNzZn1daAqltxZsq/9I/zscDLW
 l/PqMUceJJ44Q==
Received: from localhost (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
 by st43p00im-ztbu10073601.me.com (Postfix) with ESMTPSA id
 923FD180C17; Wed, 12 Apr 2023 01:23:01 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Apr 2023 03:22:59 +0200
Message-Id: <CRUDUEL17ER4.1R8WRNNB5CJ35@void.crly.cz>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
From: "Roman Beranek" <romanberanek@icloud.com>
To: =?utf-8?q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, "Maxime
 Ripard" <maxime@cerno.tech>
X-Mailer: aerc 0.14.0
References: <20230320161636.24411-1-romanberanek@icloud.com>
 <20230329195802.veybo3367zifw77n@penduick>
 <CROTQHUM88W0.2URPO95U5ZMS5@void.crly.cz>
 <2219295.iZASKD2KPV@jernej-laptop>
In-Reply-To: <2219295.iZASKD2KPV@jernej-laptop>
X-Proofpoint-GUID: g1DkOftfS7myPiNQXtcxfcmsJmiyUcmX
X-Proofpoint-ORIG-GUID: g1DkOftfS7myPiNQXtcxfcmsJmiyUcmX
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2020-02-14=5F02,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=24 bulkscore=0
 mlxlogscore=51
 malwarescore=0 adultscore=0 clxscore=1011 spamscore=24 mlxscore=24
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2304120009
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
Cc: Samuel Holland <samuel@sholland.org>, Frank Oltmanns <frank@oltmanns.dev>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, icenowy@aosc.io
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat Apr 8, 2023 at 9:07 AM CEST, Jernej =C5=A0krabec wrote:
> Dne sreda, 05. april 2023 ob 14:34:11 CEST je Roman Beranek napisal(a):
> > While simply forbidding the video0-2x mux option seems
> > to me as the right way to go because there's not much use for it with
> > non-DSI interfaces either besides the opportunity to power pll-mipi
> > down, I'd like to run by you first.
>
> It's been a long time since I looked at A64 HDMI clocks, but IIRC, pll-vi=
deo0=20
> is the only useful source for HDMI PHY (as opposed to HDMI controller.)
> So question remains how to properly support both displays at the same tim=
e.
>

Correct.

> Have you ever tried to make HDMI and DSI work at the same time? This is o=
ne of=20
> issues of the PinePhone IIUC.
>

Yes, I have. Prusa3D's SL1 printer, on which I previously worked on,
uses both outputs simultaneously. I had encountered the same reparenting
problem back then but since I hadn't been able to identify it,
I resorted to fiddling with the DSI pixelclock until it worked.=20

DSI & HDMI co-existence is yet another reasoni though for forbidding
the pll-video-2x parent. megi's kernel includes Mr. Zheng's commit which
does the same.

<https://github.com/megous/linux/commit/7374d57>

Best wishes
Roman Beranek

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D876D7CB4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3E910E929;
	Wed,  5 Apr 2023 12:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ci74p00im-qukt09082302.me.com (ci74p00im-qukt09082302.me.com
 [17.57.156.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C03110E929
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 12:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1680698055;
 bh=F9sCyrOcH7GGRQDR6k6ODpcaztnsDl3q3KGT+/q2kkg=;
 h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To;
 b=NmXz7YV7suT/an18Bm3kXN9qYYtVjz3JC1Pi8c0rRjXIdgsdCD8vRXK/hBea1Z9Lu
 quEvBE0iU0J7QwF/85KbSweyw1r7Qx/Fuv5ZGD/UPBXkFcoTwgXTaAFXgvU3AbgwWT
 4rrXV9DwtnE0SYMeftz7cBij6tYLUzfFQmuJo3L8WnFBUdEg2cUESCcpJobOgAXrgB
 l+99wx4vkv/KGzD0Md7ar0jhyNvmMeMkXw7t/L1m+1fdGYUmrMcDUZ8Q4QVJ8DebbB
 wv7+thpKKDIfqJPeY/Hz7QrQaWpX6M/549f2GK66uUSQVnetRWhjLQyg6xutArhL6q
 xsAQInPOLXWUw==
Received: from localhost (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
 by ci74p00im-qukt09082302.me.com (Postfix) with ESMTPSA id
 54AAE2FC0494; Wed,  5 Apr 2023 12:34:13 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Apr 2023 14:34:11 +0200
Message-Id: <CROTQHUM88W0.2URPO95U5ZMS5@void.crly.cz>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
From: "Roman Beranek" <romanberanek@icloud.com>
To: "Maxime Ripard" <maxime@cerno.tech>
X-Mailer: aerc 0.14.0
References: <20230320161636.24411-1-romanberanek@icloud.com>
 <87wn356ni4.fsf@oltmanns.dev> <20230327202045.ceeqqwjug4ktxtsf@penduick>
 <CRHKFX934UA0.1MCKCD8SJSPIE@iMac.local>
 <20230329195802.veybo3367zifw77n@penduick>
In-Reply-To: <20230329195802.veybo3367zifw77n@penduick>
X-Proofpoint-ORIG-GUID: 8ldobzSC-nxTZzHvT0knq1iLnYTlBAI9
X-Proofpoint-GUID: 8ldobzSC-nxTZzHvT0knq1iLnYTlBAI9
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=366
 suspectscore=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2304050113
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime,

On Wed Mar 29, 2023 at 9:58 PM CEST, Maxime Ripard wrote:
> > In order to preserve semantic correctness however, I propose to preface
> > the change with a patch that renames sun4i_dotclock and tcon-pixel-cloc=
k
> > such that dot/pixel is replaced with d/data. What do you think?
>
> I don't think it's exposed to the userspace in any way so it makes sense =
to me
>

Here's a new series that includes those renames:
<https://lore.kernel.org/all/20230331110245.43527-1-me@crly.cz/>

It turns out however that the new dclk rates can't be set exactly as
requested without touching pll-video0*, tcon0 now therefore gets
reparented from pll-mipi to pll-video0-2x which, as it further turns
out, breaks DSI. While simply forbidding the video0-2x mux option seems
to me as the right way to go because there's not much use for it with
non-DSI interfaces either besides the opportunity to power pll-mipi
down, I'd like to run by you first.

Kind regards,
Roman

* As pll-mipi doesn't have CLK_SET_RATE_PARENT flag set, pll-video0
  retains its boot-time rate of 294 MHz set by sunxi-dw-hdmi driver
  in u-boot. Why 294 MHz (as opposed to the default rate of 297 MHz)?
  The driver actually asks for 297 MHz, clock_set_pll3 rounds it to
  294 MHz though because it limits itself to 6 MHz steps.

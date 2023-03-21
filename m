Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8276C375F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 17:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E8F10E7F1;
	Tue, 21 Mar 2023 16:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-zteg10011501.me.com (pv50p00im-zteg10011501.me.com
 [17.58.6.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBEC10E7F1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 16:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1679417449;
 bh=5ukV6PY3ucC9hJDuXZfIVXvf88RafbDWPyWPmbI4b+M=;
 h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To;
 b=sgnlOBOdnJ4Md1bXyy0cTRU3QCOeruwaZC8HiYR65vzbQQ2ge3aX+tWCMisb4D/uf
 I1wWmYnpJcFCcUh7ofpd7CoOCJyuzL1O1HLrBVaMu8L7aOQZ/gbdERcEitcLR4ujBR
 FooPqSKK6iCNUA5uwLrF0m5JmtVzcgbyJw0OMdX3PjkZTGUo0ljQEsGUkcimcFquL9
 DzzOFblcqbngGjpqVtiOwQnjHkUEOGOvd/DpN1EtHz03q85d8SKaoa0y8sMoi5/9UP
 9mdLtyyboIOUOzqLQX8qA/cnU6IQCZfFe1Js3i1LM6Qk5rhB/JSk8njepVxy9Pi70b
 NV8THQNzkH8OQ==
Received: from localhost (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
 by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id BA8B54A00DE;
 Tue, 21 Mar 2023 16:50:45 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Mar 2023 17:50:43 +0100
Message-Id: <CRC7SQGZJDK0.3FEG3RZR6IR5U@iMac.local>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
From: "Roman Beranek" <romanberanek@icloud.com>
To: "Maxime Ripard" <maxime@cerno.tech>
X-Mailer: aerc 0.14.0
References: <20230320161636.24411-1-romanberanek@icloud.com>
 <20230321145646.w6kr7ddurfxpg5rt@houat>
In-Reply-To: <20230321145646.w6kr7ddurfxpg5rt@houat>
X-Proofpoint-GUID: nW3p3X6tTkVEQXdicLpHvySaM0EbhDEp
X-Proofpoint-ORIG-GUID: nW3p3X6tTkVEQXdicLpHvySaM0EbhDEp
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 malwarescore=0
 mlxscore=0 phishscore=0 clxscore=1011 bulkscore=0 suspectscore=0
 mlxlogscore=771 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2303210132
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
Cc: Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime,

On Tue Mar 21, 2023 at 3:56 PM CET, Maxime Ripard wrote:
>
> This is similar to
> https://lore.kernel.org/all/20230319160704.9858-2-frank@oltmanns.dev/
>
> What's the story there?

Yes, Frank Oltmanns wrote me recently in relation to a patch I wrote
~ 3 years ago that addressed the framerate issue, proposing to
collaborate on pushing it upstream, however as I've been keeping up
with my inbox rather sporadically these days, by the time I read his
message, Frank had already taken the initiative and sent the patch.
So that's how we've got to this slightly awkward situation with two
patches on the same subject arriving 1 day apart of each other.

The problem with the original patch was that it went around
sun4i_dotclock by feeding it a rate adjusted such that the pll-mipi rate
was set correctly. I couldn't quite figure out at the time of how big
a portion of the tcon logic does the sun4i_dotclock code need to be made
aware of.

>Also, how was it tested/confirmed?

By counting Vblank interrupts (GIC 118).

Roman

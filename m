Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BE52DF526
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A246E156;
	Sun, 20 Dec 2020 11:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 327 seconds by postgrey-1.36 at gabe;
 Sat, 19 Dec 2020 17:52:07 UTC
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3BF8996E;
 Sat, 19 Dec 2020 17:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1608400325;
 bh=6Cy5gaFo6EASJEU9gexKW7u9tGhKK2LXGIJ3Qx91gzM=;
 h=X-UI-Sender-Class:To:From:Cc:Subject:Date;
 b=TgZfX+C5doCvXagXp/REIURnjnqDRRK9TITscNWTWYWn84lYm0kkCFR61WOPJYcYw
 COvpg5nN10Gp2G179b5LAntZALImG1d0s8J08ltlHUCxzoUZg8uqJL+QDdSG1mW7th
 6fAAM0jawohfMj6KoDBYgvRHtQp/aFJSj8ZJ92fY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.88.127]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N9cLf-1k3cFi1C7R-015QLb; Sat, 19
 Dec 2020 18:44:27 +0100
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Chiawen Huang <chiawen.huang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH 0/2] drm/amd/display: Adjustments for dc_create()
Message-ID: <98e71ee7-1eb9-ada8-a438-703be03e96d1@web.de>
Date: Sat, 19 Dec 2020 18:44:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:bN4rfrJ+egUrWiXCStY4S7FyoEHEqbRV9v3jdBcVWr2/7+TKfIt
 q9y1X42hYIa1+Un3l6dMKOO0tan89u3IMWkRE4DS3eyYUEeyS1ca94TF7vgJKYHS+yuB3Ks
 797Ltxk2sI0gl0zC4qdgt0vSztVu+nGiWiR6tmYXLKY6sarYqMt7nM1fT8lNanGbinuTnus
 EIgMjQt4cTMox+WvAx5VQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HyelfwKK1LE=:M7yBG2wZCDQ67N/OeV7j+N
 ABa+UAA2eMVXdrQmxm1kyVBQp3cF+pXwoQVkAI89Phm/YTn27v0zEj5+v0wKZf9qmPzPfhNW5
 8083tr42cFzGmOdtEoBjXb6RbNiTStsG4OMOARsatWxtLFLDnU6kNes2cy89HK/6T37WXOG5N
 oWKz57JsaiezNlMnA+BfVlZUtPCUDmutOHMoVwZvGrLXNWl5RiggqGOlUmqLx9vxb9DW8gAH+
 568Lbi+GdEEDpsWDEzEO9rlvQ4QRrhywVrvFOXyc7pBkIbPrzZnr58LLIVzU+EnQ0YAkpAHux
 Yup4Vy2mOC4GEFKUYEVtz/8sqRFMf9jX5D4z87i0+gzuyXoxrf5wR5PLV3Sg9+gpi5bYJkg1V
 YmcnBfBSrhCVbFuZUdBzQurd+GzfvcLNTFuaiDamk/8xmD+p7stoHgiI4my/olM4C3ukZ27R1
 HBVG7jPBOpfh5NHYSHOwAqfo9C3fNXkZ6Eh1ZmttmVWAsjI3+a2PSQ0J5tQVFQ+UCw3nx3hyY
 MIFnBZ9fIHnO4InQhIiq1TOctJ2tp6BCG6JLXHORIy3JtXpBeGPYfIQQdQxoI15XTvVqqyT21
 zpsnphgzBoyNk9ZMctPQ6OudXb5UdwtjULMZDIRXjOPGJd05OkiI/Uh0Lrz9injpAbavKStEi
 yxCi1+ljrdF8ruy/SKmHWK1myWhPYIjnaQbPJ2c30q+jspf9TsnsYF9AczIlNODvshSrBnjvQ
 VnShYEu5UMkfgG8PnpMg8Ntf8BQR8HEz91Ti6GNyx6vsox2CPctCZT9oJMCTuK/QeUgRAchvZ
 MRDvfV9qjViE1u7dFZzufz482ms3g3x2ep1TVr0HDHxLVIElU+pS6RpxBVT9Cmi1kggxF1imA
 VZ3iD+t32XTKK06d0kOA==
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:15 +0000
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Dec 2020 18:30:56 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Return directly after a failed kzalloc()
  Use common error handling code

 drivers/gpu/drm/amd/display/dc/core/dc.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

--
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

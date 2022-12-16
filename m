Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6408C64E9E7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 12:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C9B10E02F;
	Fri, 16 Dec 2022 11:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 986 seconds by postgrey-1.36 at gabe;
 Fri, 16 Dec 2022 11:01:41 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356F710E02F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 11:01:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p68B9-0006hv-6m; Fri, 16 Dec 2022 11:42:59 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p68B5-004txG-Gp; Fri, 16 Dec 2022 11:42:56 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p68B5-0003wV-DA; Fri, 16 Dec 2022 11:42:55 +0100
Message-ID: <e7689cfa185caa5f9f8aae2e38bff98dfe3da9f6.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/5] drm/msm/a6xx: Remove cx gdsc polling using 'reset'
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno
 <freedreno@lists.freedesktop.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Bjorn Andersson <andersson@kernel.org>
Date: Fri, 16 Dec 2022 11:42:55 +0100
In-Reply-To: <20221216155038.v2.4.I96e0bf9eaf96dd866111c1eec8a4c9b70fd7cbcb@changeid>
References: <1671186084-11356-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221216155038.v2.4.I96e0bf9eaf96dd866111c1eec8a4c9b70fd7cbcb@changeid>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fr, 2022-12-16 at 15:51 +0530, Akhil P Oommen wrote:
> Remove the unused 'reset' interface which was supposed to help to ensure
> that cx gdsc has collapsed during gpu recovery. This is was not enabled
> so far due to missing gpucc driver support. Similar functionality using
> genpd framework will be implemented in the upcoming patch.

Maybe mention that this effectively reverts commit 1f6cca404918
("drm/msm/a6xx: Ensure CX collapse during gpu recovery").

regards
Philipp

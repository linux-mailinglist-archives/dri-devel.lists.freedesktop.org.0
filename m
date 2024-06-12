Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EB9905533
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 16:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F39610E87B;
	Wed, 12 Jun 2024 14:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="ir06c6gI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD14010E87B;
 Wed, 12 Jun 2024 14:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1718202741; x=1718807541; i=markus.elfring@web.de;
 bh=ZzWSeGePy11VFjnhicIZDBhClYhf9fghrdIA8gH/GBo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ir06c6gIaK8LSeu7haFUgR2OSXTW+CphYOBPjAmbmgQPbLIWvBJO9Jnzc9sh4ObE
 2vpePDEE76sQZzk6Ch8cUPZTm8zVaHwyG4wvteYUXUSIhhYPbNhKEYh46Lkp5+ZCt
 6aEYXz7d+/iHC8Y7CMdVfvTVn8TrPLPbfE1/OKo9Nb/vg1HCY8zmyqaHiek9oT49z
 3B/yFioACdAdbjf0N+Y6fM4F4AyuyMydA8OUgef3Ioi7uMVf6ZoEzB1awXpO/RBqN
 fY0he6UaY6SnJAI8Hljz+5mD1ybPs6IR7EeKLsZiX/ES/MnD4L3hJP3T/VXWhmR/y
 5cvYcIBkqPan9bI2oQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlbLM-1siBJn35uM-00cEYW; Wed, 12
 Jun 2024 16:32:21 +0200
Message-ID: <1cb42d85-2eb6-4544-b4ea-8a75416cd287@web.de>
Date: Wed, 12 Jun 2024 16:32:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 13/14] drm/msm/hdmi: ensure that HDMI is one if HPD is
 requested
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20240522-fd-hdmi-hpd-v2-13-c30bdb7c5c7e@linaro.org>
 <deaa2a50-9e16-4f23-8c13-34947ba4e4e0@web.de>
 <CAA8EJppn_mVzmd==-bs8je8VjXrNrWu0hNXWAGuP+TP3DARReg@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAA8EJppn_mVzmd==-bs8je8VjXrNrWu0hNXWAGuP+TP3DARReg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Qa6PMuv8BlnaWEaPN0trvoJibGkgRbnY5GV1+EYNT7IUlWXAND+
 PMjmSVNsuRPf71qX0iD/Em4t2SBE0abLB73fKXnXm0hEVaH6hpp44IIsiOgE9sLrtJrXpyS
 rdj+knMDe7Qab1PqIKHhebOLqzCprrlgWblb0APzwM9O1t3wXWzhnMRCl5vDrXs1+/HSi3Z
 ahEevsB1jXxmb0L7Rk52g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:utl37s2MzvQ=;eoXzZhjH6c3/951EJ8KbHC+i8A3
 FFaBqbdE02S09yOaDTN/+cO/MwpHKnxqiVn2lbGNXVWh2VlmukbiTaO+i5lZ5QV4kvvuqyKKW
 ACoPFNzMyDLXYD8enrM6WXh1jMju+cgbTzPNlr1VX4DAuVeBAf29WT8V2y8lCR3KR7EpdZcG+
 b2NXbQlsboWxslN61IOkj29eQroO99hbhx9RuQ6z/VQu2i+bFirjHEojiD+3y5SdzXgnig+X/
 kJ/eohufHyWd2LGZJLor7IKF88pauUl/AY9zWMjc3npVy8Xm9iSHqWtQiFQZ2JeZMzZCM71Jw
 7BbW5TiAR5l5MxC+a26FJ0RcwMLsJQxpIGw7zTZ9Et3D76uDYoOHAjrGmWoqmcKmu7ID95SJh
 bFtQ9xuB/TN4OIkkvEAKHR/6SLmTsDoV4+hnVfQ+CTL4Nrrtbt92LEbOZivUy0e/5chcsy/Jc
 5lrGvsDYDnEnkQeIrHePbmh0vd+PkQuzI/ahGClLKH1q42LlDIv2ikuDr9oFgCERBIFYEnV+q
 pcAxZNvIADFObwlcwj78cFEpH+1Jcgqm9fHbDncEPDmaygfV2yg6y3JbiEBjsLhCnHGukEJhk
 SArK0NBvUp8KH/gmokmRDQ0d9O8YgAKoBz5pyg6UoRvuYmiMay/apoSyFCIbwVHf6/cwwXkud
 LObH2/kbRhG4HToxaELeUi/eNr5fn8A+UPc1XlgMsv2ciZZ96Me1o7N6nJe8wQT33LR0MBmUL
 hE8aO/+dWGid19ZJ77U/bv1jgO4v/mUTMDWZqDGtJAHSGEtpwL8/OKmsSIbGsbjPIE9kyVyO9
 JeIoKiBlb8a3eDKE+IoJ+7IrOuszz6c4hvCbjLNpBLV6c=
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

>> Would you become interested to apply a statement like =E2=80=9Cguard(mu=
tex)(&hdmi->state_mutex);=E2=80=9D?
>> https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.h=
#L196
>
> I am not.

Under which circumstances will development interests grow for scope-based =
resource management?
https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/cleanup.h#=
L124

Regards,
Markus

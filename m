Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F33993F62
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 09:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3796A10E488;
	Tue,  8 Oct 2024 07:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="EjHjvpN0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDCB10E482
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 07:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1728372787; x=1728977587; i=markus.elfring@web.de;
 bh=Cvlps11fBJRNfYHYhbNrt25m6N6b4aUU69m73IXRFms=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=EjHjvpN0GLFQAjGi7MVF67u4+QmtUmpaSVRBo5CQt4aVej+DT3fus7R4AIM3KzV2
 u8sF3hnrPjkJhORb1ypKvEmyZ0QR9txoaqnheWJkBr3VYx2A7JB8ye4H1O9y51z9o
 kJjWHD3YUARo8NaOKJOZaDQSQZZMT7ZKidPrEuc0GvPxkUFFdRzEPOBvRZrGM4klM
 O8Lhh5sOWBPJf8gxfnxkLRewTnXasqjneUUTh98upA/vlnQ8xbIhelbakz4QUKYP7
 INoGDz2mG6wogLNwiOc9hPnJxu8tlheGqTP0wysacEyCNh4DVwiwi9YhRhGKO7hd6
 Uft+IzT/ghLyhmeggA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYcll-1tTcDQ0iqh-00X02U; Tue, 08
 Oct 2024 09:33:07 +0200
Message-ID: <0379b3a3-9ab0-4b08-adff-59fc8ff98844@web.de>
Date: Tue, 8 Oct 2024 09:33:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Adam Thiede <me@adamthiede.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>
References: <20241008064716.14670-1-jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v10 0/5] Fix degradation problem of alpha blending series
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241008064716.14670-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qj1iAxZU5UbJCMxFoe9Iz5waTfsYw2nGih47OSLK4wqrVTydawt
 vpiwPseNZPOF9JluNA6lc012WGZCE/8DY1NFX0YqKif2Qo9uBn2cTB9k5qZ0HjApF2KjoAU
 shINrmK++1xM42gaVfB4EqiNkTB/E315CB8KuUc9XdtI0IHKH0VIcuto3HHI+96uBGeCP0A
 Fi0gCv22K4sBfL7FMhlLA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FTXtS/iD7gw=;KycOVj5RcErMRwfHtkm0NC6CG45
 3j3lk1oAf8tmJ3SwyUe86+3mZK8+wfc/tTrHJ+we7p5g0MQ3/La/2/CivdO4UKAQrQShavAVS
 lU2jLQcLcceLEfDmlkhxZdfmDG0SLmgJ5W4hJjj+TNoGDLJXk/hzvXPX6XjywkJ1scRX3kzUo
 y84cwrffKYPm2sOlkvIN139A2C7lhHK095MIXSZIfTatNezZCDGoMfAa4x4SA3TTomw9H+OtN
 Mn8BQuIc/ETtco2QAU4icZS0mQBaMFsv+QNHUjZuzNjYD4iWiW5ZISPr6ItTNQwoycypHW1z4
 qDkpBb9zLoWKeBPjzk3sy+P8JO+ThJabtLqNYg8nz959IzRcycmvFKc0yDWEoW7DxkeUVrR2L
 gC84/s6gZda0t8Y4uHSNR+VMT6LajldwdJ+zqXH4tZDBxHVW+9aFCsktlpDgORQALahD/IMmj
 FgxzeidCSjBlSOSFwHCN+6Abf65BCd6RVhXCmLnBog3U/4ErgonAUFVUwttKd8nRlacraD0Vn
 RIkIxxHfyoyqFyf80jeL7KsrFxulvU87udSejd2pyxnU1f1OZWzb9lVnATstCcGm/fvUqnjRP
 LrnkOUfUI98t00Ox4uevMV52aojsSOtWgcsmQYfs5hdHOxZ2Vtc3ejczq561q93nq+XnjuLPl
 es+T4eNZDr4TrgloP1rMpQ9NGmsTXSkJUN57nvseab5tBVbK2eP/CCw40oVcvQzGqLo2UcHWs
 lJfdxPyPztqtSyTnlBNgMMPbDFn1r69bw8jaqt8MuMfCalahHaElQCs/gc3XxfotVm+Hat9Ph
 N4JzNE49xITTTwxfs+sn29qA==
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

=E2=80=A6
> Fix the SoC degradation problem by this sreies.

                                          series?


Regards,
Markus

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571B0A4B8F1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7281710E383;
	Mon,  3 Mar 2025 08:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="sa3oqQFX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C3310E373;
 Mon,  3 Mar 2025 08:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1740989726; x=1741594526; i=markus.elfring@web.de;
 bh=C+FdRvhtkVZnGaaa2bGtGDngNfD2yjN7+GvSLwFeCRQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=sa3oqQFX1K2fQENnZAtmV2Ls/aPlRJf7KVvq08Kbwdu8bhEu9tt2+Vdm8x2FeHov
 a5xtfQ+T1eBzrnW6sLurLTKrV+wbphXYHxzBLePh3vSS3+1Fo17+k7melT+wTeoDe
 dHwq+iLPhgRsRCmA0oj6wwVYTL2J/lIq9TpjdinHNI8C593aSG1Oeyxdh+XSagV6x
 V9okUZEw5t9MkcxIzsQz/+wyuBXYJGuRyT+CMfuQ/gjKIiDwSMVGmV1ARN+gldLvB
 CdIZt+PToF26Byj3YVlZ4+xbUBgubl1BGOC3GgNHW861FSln4UPnDsW4PyFrOZERU
 IMs4eCavpmBGVLLR6w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.19]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M9ISh-1tsbSD388V-0019Kz; Mon, 03
 Mar 2025 09:15:26 +0100
Message-ID: <12050afd-ab60-4bac-bd25-0c3cc925b38b@web.de>
Date: Mon, 3 Mar 2025 09:15:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND] drm/msm/dpu: Delete a variable initialisation before a
 null pointer check in two functions
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Archit Taneja <architt@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
 <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:l61V0/AxxnfLP2CwSsghwK08nUFAsuRp8A9xZrnTeiVv24ZQ/3i
 G3RqnUSDyuxhHQZurimb7PiKwXU+E3AYQdbSIZXeIB08KV04ZaIwwV6knwRGWgTrx/XbTMg
 CBbyohY7P+EBXFxvTLfoNgfYBAMIogVtGwuVEb013+xJ6c0saMHuLXFWDU4EPclYOhKB/Ey
 tGrwZLuNRsk+/ZLmwQalw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+dEdQWoQ7kU=;IasLY5SUCezkQ/oK2dlxCFJnD1K
 EJ01spAXIy6+nudFKoE9Ket7tA810fP2bclD61wzlHRGOv4tQIHAjxmFEE2d8kFXsN+a/mPkG
 FEVtu9wjQZHMXgKSMoC5BPZoDpkzD/U1ZXB1CUWPUuDB0pv7RJq5r/R6B12AP1OMXzCfTU9JD
 HQKL7MyACkb/xotarJowiXBcVEu/6aHj1Zp36NpLfQeCQEVhsprW05XRB6zJS5J5Glc6AS3Ie
 uc4MkOzsy8XU3/HU4AS+inJMduJnuSWrdSxzFrNSMYND/jnPk5zOirakBHoh1yny/3+M6oDeY
 9Atayo8H9W9OCjxR6DcXcnhUTdAlzZrMlUm9pZKpxtatC3AgFgv1XDDOKcf4yaidQ9xLSr/rn
 +GqCxAvIKhT+dR3vCubnYfZPN8xmkJxyPgqRYueCCKSBxhqvTzfYv7IKEMxImJWM5wpQvo5fz
 mgt/io8nxznlCpVV1uZl7qtzsUkOrletjiSuj0aOdQp87vlnvem0wTUWyqLiITCi6Y2NFcZgY
 +OASaJoFYY3kXCTYlhJWCHe6qXguImSMFZ4YobohpinTpKWiZbTw2cZikfKH6z1fCdTrMd/xA
 2jj47hfyTHRDcT1ViLdRrZrNumqNOBggSDj/wCDaLFVXlGV/vZIqRvo5SfOZqDiWj2KMmQnJL
 bwM0Wis7oqvKHx4WWYMpArgPX9Yv4aNySc+wg4M689OM3e+3vDQBUG+N9LF1C3MC7LGGyoG5f
 N7xOGsxwTbTlwpJiRk3BjZjdOFgdZgLfzg6gkZQSG6ABrJrKTP6l/K0Po2QG61tOmeRXILOoy
 5r1UjE9ozIkmxKQhxRgrZn44y1hHW6/Sx+wb0hm402OQx/ZQ6aA6dlhiYdGICGYHGpcTlmExg
 9K8IAbsr4QQpm7X1hHLtmrxfU7NoUzLGnU5twl0X2YskzuQlhbprv4pq3PliEkqOKgWHKnYaI
 uxDhPlHk3d0UbaV9ognngBO09PQe20k8Cv0i9JB9PkWhY7LySQe01zHatFls93m4uTyZDBkx7
 ButtyGSLIyuqZrDn32SlKwjM/H3LhvbD/nAVfC0nDv5QxMgrPd9jQXhi2vAmsm7j/5rveS5ut
 4zIqLIODlafpEp/zwlGAqFZBpXsHIDgfS+HgKLLI3wzft0e46RCZ07BYVVN8aJSC54MVKdORR
 5DOOgieAt6BNAtTj8hAXKQas//8niv2v7DbX2AFyatHBiySgO2uhFDUnOrXGlgvVoQPMgOdFm
 xNgbzehk63lnxFNhe3Y2yOuKjXmbhUFzrz4Ojv0zdX7bZdZXJwJM+SklDknLXtWtfkHvT57jt
 Qs2Q0HSAVP2jzgt785f8S4Woib/Cznidc0aV/A9Zb9zQJ0H8XYRoAUMO83x4+9gEFPgIXeDOP
 ZbqiAAcogIiZv76m3m2cgXepNh/SPn4ffLOmgAUFkyH/UmqOi7sgcs3Zv1buxi1Si7rTdgDOH
 +r3VzdjatZdYYDqtQCigjk2oylo8=
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

>>> The address of a data structure member was determined before
>>> a corresponding null pointer check in the implementation of
>>> the functions =E2=80=9Cdpu_hw_pp_enable_te=E2=80=9D and =E2=80=9Cdpu_h=
w_pp_get_vsync_info=E2=80=9D.
>>>
>>> Thus avoid the risk for undefined behaviour by removing extra
>>> initialisations for the variable =E2=80=9Cc=E2=80=9D (also because it =
was already
>>> reassigned with the same value behind this pointer check).
>
> There is no undefined behavior here.
Will any software development concerns evolve further also according to
undesirable null pointer dereferences?
https://wiki.sei.cmu.edu/confluence/display/c/EXP34-C.+Do+not+dereference+=
null+pointers

Regards,
Markus

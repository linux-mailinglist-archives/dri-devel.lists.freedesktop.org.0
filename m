Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A66BB44D6F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 07:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F8410E2BC;
	Fri,  5 Sep 2025 05:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="FmA8TkWL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 334 seconds by postgrey-1.36 at gabe;
 Fri, 05 Sep 2025 05:26:59 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD2310E2BC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 05:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oldschoolsolutions.biz; s=s1-ionos; t=1757050017; x=1757654817;
 i=jens.glathe@oldschoolsolutions.biz;
 bh=IvqLa41Rgi5MStRNwS+3vZ63wEGrIeqTNh3mmJUDLuc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=FmA8TkWLtPSZ0OyVb6dMNJAxrZdTgsxulIqRWDPyil87DvkRMnIajtFFqsfJnzBs
 V98ZSanIAHvwEZlfDdS9Aq5ywMtToEit/XcgxV/NmEDqwepp5Pbp9RwJ6vqgfUgNX
 M7bXTXp6vCqNtXO0iDVZc06ie9mI+gnA7ZBdiRmbDeH+xjTrfZ/RvufYJ1+P88z5+
 yBupZXMZdJHsaZS6kyP7OxZKs7OrppXg0lO+cRYnupQ7ZBQ8Tw0qioPRcLCT5AzUX
 JBdXdUyHoM+ZmuWVvxlD0P2gC4I3CiJMgrRZEhJcT71jARkk0PLGOSJOyjLBJ9tjd
 liDGLXxd+zsg9NTXiw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.145] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Myb8P-1uXdm83dgj-012Zfc; Fri, 05 Sep 2025 07:21:06 +0200
Message-ID: <2fca6922-c312-4ac6-9b1e-f2aa492e1c6d@oldschoolsolutions.biz>
Date: Fri, 5 Sep 2025 07:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v7] arm64: dts: qcom: x1e78100-t14s-oled: Add eDP panel
To: Christopher Obbard <christopher.obbard@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Sibi Sankar <quic_sibis@quicinc.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20250814-wip-obbardc-qcom-t14s-oled-panel-v7-1-89966ae886a3@linaro.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250814-wip-obbardc-qcom-t14s-oled-panel-v7-1-89966ae886a3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LCJFX39gSHvMklOr93P1mOJM7P4b9qcXgpSoFcZkrYwLAOCad08
 qy2mWKK7IydJ9UKDeNFYsbw939l+e/isCLilco/K2AkEUUMciYONWHqGaHB8ny1WqLKOUHj
 8DVHhXGVMilw3wz0nHAWtLBDMqCu6Zw8sao1HXnNdHJRupM1bzpAYbr9yU8sWwLuvG8dwGd
 BpqEhaFW9uzlWa0Jlx5CQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xsaIctNoiaE=;vqLP4nUrsfSa5S9TCQ/hnftOSWa
 eEgmaTDJtdIZQyFgIrt8Gruaip6lB5kRTpj407LX9GQ8e7r+GgZFzwh37HkmmAKgdRSMQABpb
 OWtCZuc7S6V/j+Oq3lBRGLOvUbWDTxaJaUMcfwag9hJYYCTaisdFa45PUqiZkDcnEScJISgfF
 jtWgMYvc5b7aqJkm65gABmtKyumbEAB2SuWC0KfnSQmgWGKzy/y3rf1Acc6qvVkDmipBjvbw+
 gh4iKa0u0fQSHWxtlIFOBn800v9RXCHaClewaYSpsqC73Fn38LkLpi7EmstYZuPkpipJnvA/C
 lj8QGARiDMCOLSKQ4z20LKiXH/Vt0koTAu0ng6rmMjweK5xMlKM5dFivAYqykOagpPiVaMYTn
 2zeRCDlMg90Ydlp0YtRL9ZfOuHLGq41Zx36FoRMz5Q1h5YVDmXbZt/ayUxTI1x9FAWJQqyM6f
 7HHIjQ12qa2bXYn7DoedvEb17k0fce0/92FYscjyqJy1RM+NJAxjTRFmI28Ajlk6ym/+rGNqc
 FZ39iNlc0WF1xNNkvQd0VVNITk10karjXJDIdI5EmE2quSIez6PoC76/7kGV3I2PBiat6QI1P
 3LZ1cTh2GAYoUISrgUKu/JTR2XuodBfOVgNKzH/iVUaNXg9K5JZmCIppe51rQTMu5j0A8vD8C
 vJvGfjXLeuZCewWTjPEnspQA5wSFqN30ZxR+Uc075yia5+5xYIrIh6wdDFOSkVohh1H5UelRL
 2mmvN7Q88uGxfSkVDw8R/FH5iXlk4Lcrya/t04hRyCoOVwUwby6IUrbGuZ/uxay75SQWeDSMy
 xsetTgjzYdkYuL3IgJJaM7qfDO0uNRKeuoQtm06fkjhG5QM0tzebbXLfSUK9378QNzGXeImtP
 hG6S02TqAVCVAjtaLLk18ltI/WnkTfDHrFr9lOeSRluvRAH7gO1jL2klM5aOibpzgXwfBpcoh
 GAZ2sN7rjcE87WqokPouza/ONmt+U7V97J5/m2UtXAATtMf81OElKhWezA60APTe7kk1AVp1R
 kefGRKHD1/iiAQKGmASu/lRHSVIpZod4P4OqUfFiqpg6O2zD0ep5g0b+tLVqxbE05W1PdUEY1
 Bp8D2R2LnYJ2lr9jwq0pnaKFu1K0rYxh0ShbJhjkYZ5s210Sy6OQv2IsRCsEcOUzHEw9ZjhkF
 QCBPTIzIOMt4UCwMv3/BvRE9itDLIaazaNIZLcx1oQ7iAPWnVkRWt/RuK1JTclGPOmekAkInt
 cWyjWxwuwXBc8raTveOdq4cS05RhiCv3hm+uQVErYalavm1Uc+r8/tKVVFIJd0TpBoQ4RFQrK
 l84pO6XfKGj73lt+Kr236ZVsaGg8GKKnaIc4LppQJv7amqKiAG76+3dDssCyn3h8hUjW9Tqfc
 nrTfDGP5NoZYVxkRXYLyfC2G+Ff5gKN4Y2jgWsQa3qVkT5PJQMjZURr3Abo2P3N/ZFva14QIb
 vh3i8SvcfRjOuSmnEuFaqEqn0fxPwHsqdfINWJB/GuqCV3XrzOSCGtcoI0rzc0cbYSeK3MSa2
 gVt8bNfmWMJAJdh1kWgOvqP/hwxS5HLSqc66c7DW3k90c6G1rXa5y7y5u/HF9roc1+BSdYr7O
 yIOlbLglwwayLwjNwWmGpDG0QAbheDOJxWVLiFEXWXYveqQ5PF7tywoE6cQ38wCzhMGRhjavL
 3IrCg61n4OGbCpoIEFaV6YNlPP8HYIZ16iEuhrkGNHoYYcLf3jAYCuti0LwZXAYtT/uHRYrlP
 yRWLie0oAgKM5V4mFcCZDM4mtPQzim3M0ge6CoOBd1vm6rkQAZX7g6Zs=
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

On 8/14/25 22:16, Christopher Obbard wrote:

> Add the Samsung ATNA40YK20 eDP panel to the device tree for the
> Snapdragon T14s OLED model.
>
Hi Christopher,

I have this model and the prerequisite patches in my tree and using it=20
daily. Working very well.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens


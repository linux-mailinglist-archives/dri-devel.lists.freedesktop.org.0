Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8DCAC2F60
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 13:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2933E10E04C;
	Sat, 24 May 2025 11:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="HI2L6O5F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4472210E008
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oldschoolsolutions.biz; s=s1-ionos; t=1748082980; x=1748687780;
 i=jens.glathe@oldschoolsolutions.biz;
 bh=V+8gcksgA34Mb1jQ/H076ofeWB/Ytb2Wb9fhfJ3Dbls=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=HI2L6O5F3lmbfegAQXq48k9bnr2fEANdQgyHwY+Om+v/gdURMEsCf/uttIHSfYjX
 9PJEZ5CJieGVqx1j1RfWEdeUvZs0uDe0RWHdHWpUgbTVz0Bqj4LuuuY+OLpJe6mr2
 +63AsYB8JDOfi/gvrY+gqU16UZQTitL19DEQUrQuOqWL4cMs5Mk4AJcbiey78XfTH
 EseOe2zqdxyRD7UL56v/R4pWvQ5rnuAoha6IVxYaHbcgVWE8UTAeHVtWXmxbYqR9L
 m/6i276YXjA5DufljIFmf2jI5xcKQwQ3sSmnr1hybkC7cv5+0JPet1o+ZlVXJgJ0D
 ixxtpAyazT6gcqaiMw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.39] ([62.226.41.128]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MaIKJ-1uO3Zh1kRx-00MAMB; Sat, 24 May 2025 12:36:20 +0200
Message-ID: <342fadba-978a-4aa6-a393-22221715a5cf@oldschoolsolutions.biz>
Date: Sat, 24 May 2025 12:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: x1p42100: Add Lenovo ThinkBook
 16 G7 QOY
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
 <20250524-tb16-dt-v3-5-17e26d935e73@oldschoolsolutions.biz>
 <6iuro54yed6tqfej6l2l2ky7dletbs73nwjnfufbuulkw3kl46@okoj2v3wvck3>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <6iuro54yed6tqfej6l2l2ky7dletbs73nwjnfufbuulkw3kl46@okoj2v3wvck3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:CEXvmp4XCv+8zPPu+FcRtrcVcIxIkzBQVcfODOJhdqb7Xq5nhl2
 iYumIEoYBXlBZZ3Asv1pLlVyv8B6IyUTNMfwrGnSNjuzKsFFeMAzXxKDKxUA+63MbZhzxVU
 AcE60yDuRzxqTw7NwXQhR/u7VUz7PwFW+rxOAX5wKLQh4GXX8Z2GbRSadCWUC0rLSE//4QY
 HaYDaaBgb/Xlj8nhFretA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HaksTT/H3F4=;joX8v6RaC6bDY2V4wyLRvZ/DbmZ
 mtyqA20yirrWrPeh6vG9oCyQW2pROsTkYb15jcTtashpqwfvFYNOon+NgzZ7xvqjx5kszWFeu
 Ea9Q08RQqGGVu9uJKNDgkGVke5zpyeEtWBaekqeaiqXXWpzuyKr9ujFhXLWtXbmZXlHjbi3KH
 MFdVSu+OUw7ULqbK4LR31RjHPc6FCAX9m810fkoKvUzyp4hwJ7MJ6KKfhgMjzywoQKFw4L1v8
 XSLpqqcYujLQRiyUk6nCoPkPSz92+QpwSTRUt9vlAl2r6nCP9j1Ct9qKtYLb9yrMfCAEehIQA
 GIC5FBbPD3dskWUY+FpU8BhSXUBVSXgWMMU4zGxE/Fr/H0i3xEFUsLEwmvygJqqccM2YQhgYi
 Zr3vXS8Bjg6Pa2PH8zCR8aNiLhGsK2a7bBSU3VLwbfi7yhn2NiMMyxHh2+/Zhpg9opxImifw4
 fVoY1kpdY4Fm8b6VasM+PeJLUkhlBqLmd7RppEGlg75WdOXoHio68X7qOtA4gNET5P1rsqSvT
 CBcR5YvXVVlV01yvrG89vCI5nhAD8m6hXP6XL4J7J9E8X+xjj0j0W8qNvmdDKhGozMY1YYDe+
 CB2bov3DYoENJMYlkZLe1aEqVCwNWGleBjxq6QZnkN1KhMdPmA9xv1b9X+LQZ6xqJeDMeBYkw
 AlV6LHy51iCbnr3NOeDgbkOxK58FsX+o2N0iAmtbT5kFP2Y+I0xfdd6DzTejEcE0UQPIL5S7U
 fZiMPkptZVQSswKwPTZwdHlI7zJkdDrRiqo+QNvRaqLptyN8GBuaR/OEjSDr7j4vL3O+L27GQ
 VkGJxZ+nsjL37LbLiybmzFVVEIMMNrFDkpCj2F1z3kcdvbELxf4eg60Us3T+Cm88hKdHLsMRK
 Re/N3CyFYCGRSrVUQYvFD+XStSpkejMmZchmEIgrDvtiXvtHDsG7j/ZvmT584UL8z+6+c3JIN
 zIpkgl72A6MHdZ+0ck9GUuB9telV7i2s75vZZ2TA3HYX7aeOBOAjf8Tx+YYoXGx6IgGilhwWj
 kOIcaos7p67ZD7HTJAW1FpWNr2KTN2ReJp+H7tBBJsGxw/+nEDXUAVb3IICmKzQ4uAtMsT2/I
 1k4GLDFYiLv4yYnBzjoo+Ir4GELVKCR08DcI8YqJQpeqhGxrvMd6O5H6TAUAH4Oi/ErSnOH9Y
 oxdaM5nxC9Tcsozn++mMR2kFJNfPmoyZi/H7diXzl1s4D8YQM1kZN2Sl5w/+n73Ja09Uu+oDn
 YgqWvs++izyc309NPgM9PdH3BXah9a8+99BKUu4OZUpUdko5O1aNgO1tgwXBD7Qdanh6s3MLE
 q6EN/qbCK4XvRGOK/5gyzGnZe3UtAxqNxAnaBhSKaU+YUC+JUBRpwzO663l56fk8CjMHXnwLZ
 adCgolBkQ8d5IJyMY8PzfzIEr4SKx+z9WpDPOif6KGW5Hc6QbeXgA+QvUm
X-Mailman-Approved-At: Sat, 24 May 2025 11:28:11 +0000
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

Am 24.05.25 um 12:11 schrieb Dmitry Baryshkov:
> This will break without the next patch. They need to be squashet into a
> single patch.
>
Changing the order wouldn't suffice? No problem, will squash

with best regards

Jens


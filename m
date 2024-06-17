Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810BA90B0F2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 16:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D83F10E3D4;
	Mon, 17 Jun 2024 14:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="B10/mBrl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D10410E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1718633167; x=1719237967; i=markus.elfring@web.de;
 bh=rAFBHEie0tyE8G1d25IpirjDgFW89pQaM/fImMbeKhw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=B10/mBrlkQqWXSMr1hJTR8Jdnlein+KeWU9eMrbCfSe8LCLscuHdyklfvd5KLWF0
 o9aLayT7UPGwGLbvcExBi/lHH8RIt7CZP13K5QuKGqed7+QSt4dEx7pctEPJUtTOM
 DFTOdC5ygpzcw0ec8RTOgd62ZI7yQQhDuoC3kal8JdYcmKZvwcINzv5c24hcPvFBJ
 GB8BCH/Epa0OieimglrXgr2defxR0GGDvGCsT6sibUH6RCbmwX3xeQNF+ZKk9uJE5
 ZUSRmZkShfz76xEMxMIAv/wqCXHZZ1QzUWx5d1GlwWRUCgwC+Bb40VXZTm2GqUEzy
 C5d5+4WlIOwkPIeYaQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MAtsZ-1sCvbi2jQv-0008hB; Mon, 17
 Jun 2024 16:06:07 +0200
Message-ID: <9d13548f-7707-4741-9824-390146462db0@web.de>
Date: Mon, 17 Jun 2024 16:05:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Abhilash K V <kvabhilash@habana.ai>,
 Andrey Agranovich <aagranovich@habana.ai>,
 Bharat Jauhari <bjauhari@habana.ai>, David Meriin <dmeriin@habana.ai>,
 Omer Shpigelman <oshpigelman@habana.ai>, Sagiv Ozeri <sozeri@habana.ai>,
 Zvika Yehudai <zyehudai@habana.ai>, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240613082208.1439968-2-oshpigelman@habana.ai>
Subject: Re: [PATCH 01/15] net: hbl_cn: add habanalabs Core Network driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240613082208.1439968-2-oshpigelman@habana.ai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bxkFy6LWoY9U6hOlzw6Od6W0cDm05NCRvqXqGWxxyR0LK6U9tRB
 wXEPJP/oCkw35OIGJ2lZ5PlejFFUvhnV/vSjPBVPxN0f9Wx/a9p5hfFrUZbI25VPeW9uEnN
 MoXDuKof9HFzaT8oDc3VZ74eCzttdDFGzIFa2MOeI4mQmRCVYrYpGdZtXOdgvWv70rs4oTi
 gG30oJ9Zmqp4O9nJZvSeA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/XUX4gpEYYc=;owOfkOd1IjGKzAmnsZD3EnQ/DgC
 htmnr7e2oXhtLE60323+++u46bW1UNlqntPulw+WthoxvFJAQmGF9f5O0dPPlaSCy28R8VPff
 oOJ79YUsmrHw8tsBpwgfiDhF2lpOWwAyuLiZy8RJZtD6vr4Uwpk4WBs9RJgFZfqQufw1kcuti
 B7PTygTYlt3m7iobyuyIkImJkvQaA+/3fpdWY+OfkvGuvxwv3DsBTjut+u4ndyR3FTL9oXzF+
 5a43sZqRMKtOA/fRbjY/mbjhBibiURrBF2MGEQJnwpJbvZqcDH25IbshDT759cAZd1aUmPAJw
 WPlj6U+nLQYs/simMrWAmD4gPhn828RcUHvd50rjsN7teFrF+tJGL2fP71XvhUz6PvqT95nD9
 n2udzHjoYeQ8njq6DBZoIyBG3LKn3VO1w9wXqlJWZL9azF9g7MGPz4OSZWjwLswLiB3+rSXPC
 tPOqcAz3Lo5mkWvspogbSSWz1x6cBX82tBkDXV4IikGBoBqc3DOkDAMgPfAPsMe4Ulhl4ZasS
 RgbhMMn4Qb1q/D2mJ6aUhobHUas/I9Eg1j4HZPHD/Da4osH56460Dkfxi+f1yv2j4lX4JR6dx
 Iwr0LrhWZq3Arn2ivmzrj+grOKYviSTmGzEMNdE9xCrOrXWxUA34/6zS+pl8WZQqftyUFpRoe
 A9Ginu6yl4jSYydHK5I1+UDRjSKJWwifiHO4XpgZPDoOAqPANm1PVJIpZtHeZluzMbhW5D/94
 g8HOW7YxjIzbxBie9SHSPpuerawKvodR855dn7UREkIupMU3exh3Y2tmMWXFMaIiSs3GcFGX+
 iMjG8frxGPn+DybcGdyThMNZyQ3owr/GETwN1/sflffDY=
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
> +++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn.c
> @@ -0,0 +1,5954 @@
=E2=80=A6
> +int hbl_cn_read_spmu_counters(struct hbl_cn_port *cn_port, u64 out_data=
[], u32 *num_out_data)
> +{
=E2=80=A6
> +	mutex_lock(&cn_port->cnt_lock);
> +	rc =3D port_funcs->spmu_sample(cn_port, *num_out_data, out_data);
> +	mutex_unlock(&cn_port->cnt_lock);
> +
> +	return rc;
> +}
=E2=80=A6

Would you become interested to apply a statement like =E2=80=9Cguard(mutex=
)(&cn_port->cnt_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/mutex.h#L1=
96

Regards,
Markus

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E837C18D81
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0889A88A72;
	Wed, 29 Oct 2025 08:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="DnFlXXlE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3157810E719
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1761725209; x=1762330009; i=markus.elfring@web.de;
 bh=53CR8Bh5SPr98P275zta4br60j/YwcTjhCc6c36UQgg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=DnFlXXlEndpXX8xkevNFx9WvxOs7l8cx/fUWaR1eWN+ZLmrLc7zuQBgfw7vXmf3b
 ihAfY36J+dNQIZNIu9Th7/hjs2rFQpFBaXdTb0Nru54cDyYL7+qOcbICJtMQDSNBh
 2XOtI7hNEYu+u5MIYEtikVkJ/iIQU2jXEEc8a8ZrAG7qZ+GqhPs55Z3DIzSNkpU7k
 ygtaJ3dT16qAwKunum69AM+36rsLNvioTM8a4qBRRpm1p0hOCod/IHcdM672bZpAk
 bASmfv2QRXv1vgu4+/Iz3eBKjXmaSvtU1OgR1Rm0RCT+6IvV82R9Y1ObpX0zGl5MF
 f5saIVaZI9emz+LrpA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.249]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLzn1-1vVGjM2nIn-00S0Ci; Wed, 29
 Oct 2025 08:53:25 +0100
Message-ID: <6238912a-8733-4b2c-a155-82bb081e6063@web.de>
Date: Wed, 29 Oct 2025 08:53:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: accel/amdxdna: Fix incorrect command state for timed out job
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Max Zhen <max.zhen@amd.com>,
 Sonal Santan <sonal.santan@amd.com>
References: <20251028175452.2329497-1-lizhi.hou@amd.com>
 <b7a2ac2a-53c3-49ce-862d-eaba86f0b298@web.de>
 <605e6f4f-8e96-dbe4-d43d-16bcac63f94e@amd.com>
 <3dd7e061-8e6f-4d3d-b56c-7005da8197f6@web.de>
 <b2cf67a4-6795-d743-e90b-db10f636db2e@amd.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <b2cf67a4-6795-d743-e90b-db10f636db2e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WUBRdfcOWMblhe1gb6zPcBCg5r3KZFPkHjliYl8GNqkbgRk4ID0
 o3fE/JC5S9hZQ6W+0uMfeLcG1HcVb0wiB2aGI66EOJWenANDN1JmeWIoF8DLaEt9vkPceH5
 ledHZoIE9Ym/DU9/OuwMNn0y/eCKAQw/SkMzZL/9w4gF9vwQUTIq1RPu+JnDv/bqA0PcWyq
 IxQdED4MMWDyRMJSPWfWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZtZek/v8xjw=;n6sCrD0jFPnZka1fTpp8lkEDWH2
 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
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

> What=C2=A0are=C2=A0the=C2=A0duplicate=C2=A0statements?
>=20
> Sorry=C2=A0that=C2=A0I=C2=A0am=C2=A0still=C2=A0a=C2=A0little=C2=A0confus=
ed.
>=20
>=20
> The code change is to distinguish between the job which is=C2=A0 timed o=
ut and=C2=A0the=C2=A0job=C2=A0is=C2=A0aborted.

Would you like to clarify the usage incidence for amdxdna_cmd_set_state() =
calls
in combination with assignments to the variable =E2=80=9Cret=E2=80=9D (acc=
ording to the implementation
of the affected function =E2=80=9Caie2_sched_resp_handler=E2=80=9D)?
https://elixir.bootlin.com/linux/v6.18-rc3/C/ident/amdxdna_cmd_set_state

Regards,
Markus

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1968CEFF5
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2024 17:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CED10E0C1;
	Sat, 25 May 2024 15:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="BB4VBiZx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DC410E0C1
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 15:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1716652396; x=1717257196; i=markus.elfring@web.de;
 bh=L4m7Fdh4Tj1XBqkhWZwUbBfV6T54F9ZygtQb5A6gqLg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BB4VBiZxXgWCAnrwgXJG5osFFN6ugZX5WYXapZDRaJ+uN/ko/DAYyv8rkQ6v5IVI
 zmO5lnS+gZmFSd3OrdraB2zcq2n2IPGKijol8Y4T7Qgj14C4iAZq9AucbGLvJK1aH
 jbfMV5PbNLG4W5fRcnht1qyVhOOdIjJF0fg5Wpw6gLhMxB8tFcr4M9ow/KKXHA1le
 I+JbCoLnPJYumnP0ICYLfk/lnkH3s2fFapEaBANIIZw9anLzjyAr6uyiDGEwQ7QYC
 uh9lG42ek/CUdavLD3Geh6jMS5lxvlTDgjwboE9N569FzefLAzm9XmemBcbDIgUTB
 rooYb/rrR1DHtwj3Gg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N2jaS-1sepe40oLE-0131uc; Sat, 25
 May 2024 17:53:16 +0200
Message-ID: <448230a6-1afd-416f-a430-3fc83d81908f@web.de>
Date: Sat, 25 May 2024 17:53:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexey Makhalov <alexey.makhalov@broadcom.com>,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, x86@kernel.org,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Ajay Kaher <akaher@vmware.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simon Horman <horms@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tim Merrifield
 <timothym@vmware.com>, Zack Rusin <zackr@vmware.com>
References: <20240523191446.54695-7-alexey.makhalov@broadcom.com>
Subject: Re: [PATCH v10 6/8] x86/vmware: Correct macro names
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240523191446.54695-7-alexey.makhalov@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cmJLXeOyO6RwrkGVOYZa3TDqSK+xvVSWKeWZu05zk6kvDxPi6KM
 VI24pllby/m9VxcIP611LmnPKT3Fkb6lA6kPaZTrlGfidwOThVsC+SImxKngIDDFV6xW6BP
 J6RXUK+VqU+ENdI7eNUSxO6SAl82GwEAtBReZA6WBG+5uxYWZk2/ZxJmuB9BaqFOoor088e
 IJYEq2ueiDM77HRnLv6Lg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F/nmIhTSQEM=;WriBGqpL96mcTgTrjkKuqUYepA/
 UohE/5dqPTe/KgqqIo6WN4SmC2QoADhjOr1NRsUjVJlCorMWJdgT+OGfndZfvuYSll/4sGSTb
 abUFhN6sj6CunNVjqF7byQLs2Jg/VI6HlWk0ZZC20SecLBIp2/GBPqABkmr3W+PJQuSwrvXrI
 /gJwrghxNrelmCCaBCHdqtv9ndEagLjQpSGNodYv9OPFL7kYDorV4dqvT8FCcYTFrhVeV1prI
 oO6SYTA9y7H3WsRSO5s+EgGf9Ko3livXoMiaUarggm9xSeR21+EePao32z1MR0F7+sfppeo32
 dvw94GD9I+92QP+DThlY8uXQyw3SZt36Z/iNrpGUmuZjzWMtPsFzDuhuB+jLC17VP7kYO7hmn
 R3N+3K6k6h2BTGWSncnZaKW6VEYsaSzkKzVH03iQY5JyBlr1EAaDUtulo26XRNL/25ktFQf+0
 FpPsRZ+7H0ninFsvM2GhVEPzyXeRw8KjI1MQf0iAU+XOv1z4hSI61NHwzX5h1leBsQ2MwoA91
 ZLVvQdisSvpzC6VAiMNdQM1pg98ynpkS6Zfmmbv7VNr4M9pkpRsPu7A86dTm+wUPF1ge8OWTK
 UFDe5kcry8dYUDcnMpbCuOfHRaCV4MjXSKgjim82LE3reHwBHWyJD813B9dpQr7MhQrp1sVmU
 sGLuRvFwNOqz2cuRtcQ/VSL2NN6GW1GoPCAXw79Uws/tI88dgCJ0fYbc/6Mnk/XwUFWcnMLlN
 /nE9UjAnsNkT1sL97A65WFkmwcjX5aevSrBByJ3Fwuhl/tGsA6puCYjY90gRZ7vEGqmqOi9BC
 xI8eZTNeTIvWxeuVJ+1tDC82CUxAg53nQ34H/Cc0p/qlM=
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

> VCPU_RESERVED and LEGACY_X2APIC are not VMware hypercall commands.
> These are bits in return value of VMWARE_CMD_GETVCPU_INFO command.
> Change VMWARE_CMD_ prefix to GETVCPU_INFO_ one. =E2=80=A6

Can such information be relevant for the addition of the tag =E2=80=9CFixe=
s=E2=80=9D?

Regards,
Markus

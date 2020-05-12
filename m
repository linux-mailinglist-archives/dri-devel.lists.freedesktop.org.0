Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA251D0BA5
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148236E9D7;
	Wed, 13 May 2020 09:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8A56E0FC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 13:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1589290863;
 bh=sSSCz3nERf2NaGlrEvfju2VMp29t3D910dvI/Tpaaz4=;
 h=X-UI-Sender-Class:Subject:From:To:Date;
 b=jX0pYWGC7Eo2A7UA7KDdb9nRgPdQsSkS/ON+7KqW/P1vv6PF7mJzLUxron6IOpGEs
 gcBfO3MwtF/vo2ykABvNQ5sJ9zMkGvEtPXjAD1Xx7/ruHeH+DtrAnIHlmsycheWHt5
 0iu7kqKvDnUHMxtRCpBLp2pyvZUw84mDIbggrQKY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from mobalindesk.lan.lan ([77.6.160.34]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M89Gj-1jTqBw1WZX-005LLb; Tue, 12
 May 2020 15:41:03 +0200
Message-ID: <56fb2eaf4241f80799f25733c242489e00c6021a.camel@gmx.net>
Subject: [drm] Reducing the compressed framebuffer size
From: "Massimo B." <massimo.b@gmx.net>
To: dri-devel@lists.freedesktop.org
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwAQMAAABtzGvEAAAAA3NCSVQICAjb4U/gAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABGUlEQVQYlUWQsUoDQRCGv71LjB7KSSBwwZCTgFhY2EYIHmJnZRMLo5AXUMRCBMHcE6iPoGBlINpoZXGVeQTFKqSxMgYtTBFcZw7EKfZn2Z2Z7//hr2ysZ+5tqFLmWKVaKKs0vWd9TJx2AibmoQcupj6CCZirqTgzA5hmsdtQWe5/xAREX7uJ3MLP9x4lyieNO5mcOxyM8HH79y/4Cdn9R3JDsts/uGO82yOMJf/ah1Y8tfQEIQt7Z7rCawtNiUpHFgYUdgTxgI1NAW6SvxoqWabbw0Bd5jpQibTNBC1F4nIMk2TWhTqIs+fSVpzfCsVR9eaiJf5W6mtWXK7O+vKR4nWkSYSuFbP4No3Ht6dpSN9pSMYmaXI1/usXT0FM3SoTKAAAAAAASUVORK5CYII=
Date: Tue, 12 May 2020 15:36:01 +0200
MIME-Version: 1.0
User-Agent: Evolution 3.34.4 
X-Provags-ID: V03:K1:2DmAKbrPhmopslhMrlUkeBiNM3w9yN6UtvNvTIHZfUOge9lKoKh
 3QBNUcaUVsWxUNsPcaPuIlP7lHmAnPmzb4DyccYtKxtJ+u4TZerLuJJ4M7XwC6bbCt5c/8k
 lJF7G+CD4R3dHxQFb8r99SxMW2aLQ7BMFNLpr30V8+XueZ65JNpJTn4qjjXrlHLsjwr7P2Z
 1GE8vE/07lYaSBjDPbJpg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mrDycf7tLNU=:ULOyRoBDFfTjD440aSkVrF
 GR7mC8q/G0EEwZyR4bzLceVtfoIghtcqB0NpqBMUXqH+gsqUshZ/wuKqOSO+jl7CdHcbgNwcp
 /MUy2lvGbpwwacxC0OGhgd7zRNpcf//9+qBpfhSAODbvvOtkwNCqhk6deczRg1bS11OAqwSNn
 Glp6bivtlGJEYcqw7djlM4OisklbAtZkMlsss+6JYlu3mTA0yBgnLP7MLG0yz0W7tmGA9AiVM
 tgsNaxcVEG2DMhGMaFrpmQ0wbWwSAAP/fIlmnjZJLZui+3YWyyfYDlkN6ZV8LnQmXw++U4xRT
 hLIC2AMXHAuXtrKIzyB1WMdH/GjIpckM8vrWF4sM5SZ5zSl4KuOrZf7jeYE5QqfIU2uSJcp55
 XNXLkLxwcLBdxUk6NC3GMx+tNVV0bv34hC362WIao8PvWTnql3jghqqIG7LtDD/l/PrJSi7CE
 hAuDZULPWjGvoeDKLQUVIyl5zNFQC2+FfGXGriqe4puSJcmX6f6gyuxYbBBN7xpI/TurZiV0U
 3+4dUrAhO0dNQqiX4fjKFWGd2sWaIf10zlIiBdUVplSfWrvjqG8XyKnfoZ5uP87oEtpnqB6a1
 6MwOjHvSv39vR6euXbt1HPq4/C0HYFYqK1xMcLphEzxT2BXNnEBjLhFVmG7hTwulvZp8/Godr
 MJ0IWNYCePzxNKp1WiaRvpM0za9TKl1lJ63ogBX2p9T6eawZu0GMoMHRC6jh8D+Jm2QqdFfO1
 6cG2U9xCyAF7cd6nZPM2y0lH0R27Jubh5aY0mFI4kDAHc7oeeE/qs2CzWbQqNbB6rlD5JQkoc
 NenpEYpN9uu0GobBLJBjYbUnylNm0k6eSFScCvZTDFhlDURROlubecrxS/+9oEoG6SJj+b/H/
 /SrFSWPWQSvzzACMSvQKlGW694F4Z72Cgfzt4GEtpnRPh0IrAoY9iQ/wvb7aqRDjFkUgymaHC
 ZJQhKsB3JEjUvrYOYnuousDG2SgCLkOfRQksi9DMa5mygbeqCBBOFKrkP/5EkoSF8/imqz4kM
 HU9bYltvEO1iHht37nthKcr0rd0u1dPL+Yh97oPK2Tt6Q+CVbiBcQ1csIjfogAkjGGEWTSslp
 xtnw1N7c9JVPcBLXA4rZ9RpfKt9PHySAck4ukaitIIcm56dhLd9DlxUzVgCKkOfKnB8l44o7e
 ZPMmYVi6lb6BTs4U8dPuiuOPbHqWZdUaMe3ZV19QlD2OMm5FNaULW38fIKHldfPLpOEl3qWPT
 YvClC3HPj+hRdQXsw
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everybody,

since Kernel 5.6.5 I encounter many syslog lines like

[kernel] [drm] Reducing the compressed framebuffer size. This may lead to less power savings than a non-reduced-size. Try to increase stolen memory size if available in BIOS.
                - Last output repeated 4 times -

I found some explanation at:
https://wiki.archlinux.org/index.php/intel_graphics#Framebuffer_compression_(enable_fbc)
But why do I get this with a i7-4790 Haswell, which is not pre-Sandy?

Anyway I followed the hint and set

# cat /etc/modprobe.d/i915.conf
options i915 enable_fbc=0

After reboot the setting seems active:

# cat /sys/module/i915/parameters/enable_fbc
0

But I still get the same logs. Which BIOS setting is responsible, how can I fix
that? Is there a better place to ask?

# lspci |grep VGA
00:02.0 VGA compatible controller: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor Integrated Graphics Controller (rev 06)

# grep name /proc/cpuinfo |tail -n1
model name	: Intel(R) Core(TM) i7-4790 CPU @ 3.60GHz

Best regards,
Massimo

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

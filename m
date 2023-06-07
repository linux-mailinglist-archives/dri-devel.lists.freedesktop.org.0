Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7EE725DF6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 14:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD6C10E4B9;
	Wed,  7 Jun 2023 12:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED5610E4B9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 12:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1686139574; x=1686744374; i=markus.elfring@web.de;
 bh=6chuo70XXhecT85xnImiN7NMRt/v8RSY2lGSl5nhBDU=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=IoDoT1qdwJN4vgCxfce9dV9z3hEdHk/U7DulVoQD02Vhfrh+tkGcmvanMgo3S/prWrPUmk8
 PZdv/kg5sTURolgMfM66nAoz0hDVFmi+WTvdn4ginU8nr+aMaIcY+mI6DDo3eQeg2AdDEC7aT
 aiVbiF/lOF/f+1W9FO4T6aIXDMuqab+XDb6TOYaGPmqN7jfD+wfSTWcgryyXPNv9UBoRuFCal
 6IDC8szGoZHkxDTuSHpav33bkz39glZynk7wdvfTlZ/TbTCwkurRyEfncgaygk2uKsiOrwLL8
 g+DkoGyG4yLZvaeam0oaA5PGOOM5+HJbVaGCjp7GbTHfUZi9rOew==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M2Pda-1qAjHM2Cas-004Ibt; Wed, 07
 Jun 2023 14:06:14 +0200
Message-ID: <16a8f34a-d4f9-2e1d-02cf-e4c53f89c006@web.de>
Date: Wed, 7 Jun 2023 14:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
To: Thomas Zimmermann <tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
Subject: Re: [PATCH 00/30] fbdev: Make userspace interfaces optional
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230605144812.15241-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:HLJu3C5+QINumy8sRjbR8nwkiOX7p6KZtFQw0RqgP0+JEEB8slu
 01fSLWefYlRXECGJ7GOibbHng0TUOSMfTMbMf/k3O6g/NWxJKz6Wie+tgu20NoZwN6yjYay
 C+n2/an54kVI7AqiWkNipJ9vEd7rorauiigF+6G0JAi4d9+NivHWg4HRT6HeuiP/BPwxP7m
 5B8Dtlvk2grfgZ/b15uog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3mXE4J4jwNg=;4J1eOVcFt0HI6F6r20RE4cgi7eF
 0YsLw39qZTxbWOnBieDFrF3xVz+JZoZ+9h2uZDHu3oX+87OwHIhKaduHsNlTV2sUbQOOx/NS7
 zgJISmmGmL88X8HjTqTArY6wNjjQ50plzBWQbp7CaU0gytZnL/k9V2DT89fK8fUzqreTNGEeH
 m2X/cuGWec7k4anB+kEtJoxnleaAcptlZI9XOnY0W/+G09Vzi3D9+uI1qis8PTsxqsznMRHT/
 Y8KyVafoiR7AVFyZo/fsikZ6QNjxFJ87rgtlzGu45kCQFtBe/fKBUdfJ3unokZs4GCriqw+ML
 QKZOs8PuXcIdTifPbQryFlDRPrYSBSNjJRjmPBa/sunbUZiPgADDbwZ2IcQNxtAP/cgWcuORj
 Zsu+z7xgbwwqppVDqw6XLNnmehe+M0EsLgJl+oBsADx3aV+LL3bApxpieWh4DZUu+pSKROZC7
 KaWsNyHMl3Oedf1sP2ipRQc0zuWTZ4wAX7ngQPQkZsAqz4enaa84G2iHQpuLSFNocrAoo0bm/
 R2gHvDzQIcAl3ucxdnJC6+P1+La0NdNCdFXrE15aB2qLeyJ0iSyqyEY85YB3iTEXiTDq+dZkh
 HTIRKXvgEWCeAu7FDE9lTDO/jZySKFaAgQSP3oamhkn8mXisKBdVCOlIarQOhbxcpxZjcQTdA
 IJF9QaCyFNr/KSQTu1tFT0/OIg2JwIrcnG4ShIZ5VQpLnFGNOFoOuyz7xuYTQPdHup6MCWgfR
 l9VGUjJfxXlMS7JzczuMImugMF43OK11JXlHOQfyb5iQ8aEcpJtGY36+jay0qDflJstb8FIYd
 EHeiN+iy9ptZeCQV2YtRxiVLBxbUtz1WOKf6l6PxmLJoI0Pqzs1npaz6aDxNnu11HDC6pnh7t
 28dP2Dx8m8EQ9D4lzp1r/rZ4MSlqZK/m37t6PLbWaW9iEdfVm0Efe98PmGJgV+LjVt0y3mMDl
 UFj0oQ==
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
Cc: linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Modern Linux distrobutions have adopted DRM drivers for graphics
> output and use fbdev only for the kernel's framebuffer console.

Would you like to avoid a typo in subsequent cover letters?

Regards,
Markus

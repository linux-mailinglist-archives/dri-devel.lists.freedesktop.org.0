Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF4D3854C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA95E89A5C;
	Fri,  7 Jun 2019 07:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DA0893EC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 13:22:32 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [88.116.7.198] ([88.116.7.198]) by web-mail.gmx.net
 (3c-app-gmx-bs71.server.lan [172.19.170.216]) (via HTTP); Thu, 6 Jun 2019
 15:22:28 +0200
MIME-Version: 1.0
Message-ID: <trinity-ca1cf7b6-fd09-40b9-859b-d3ed3836a193-1559827348935@3c-app-gmx-bs71>
From: Moesl.Hannes@gmx.at
To: dri-devel@lists.freedesktop.org
Subject: drm/imx: 'flip_done timed out' on i.MX6D+ and kernel v4.19.48
Date: Thu, 6 Jun 2019 15:22:28 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:72LrIfp+6i0zcXj/MNjtlpzWY9JU2uNyGJ/I3/0vKGDI0MjxYWRYnfqPNEC1+4qEuJivg
 GQDeT3dUfO+07Zj05xTwaPlSoQ95gHogAykc1CvloB+n6PJm/VkdfhaT/S/B8aqq7VyM8n1QeQuI
 WF7BGpIOmmmpO+LxgcQr+ql9oEPWgtRnAtQeL4UFuJOwTK3G/KBGinujuLlGbU1J127rk4s4w2Gz
 /b51q7CiCDD9ErbF7JRvgZZ+lWbNSuR8SPgLo7z5cnirjQGdcxO3UgN9C2SAJeeqjFiK3clCBc4g
 rM=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zGfWD7zRjBM=:+UnlHJ0XJ/rhQjfsoa5FCR
 LATgTP2eSwaQgEwB0BtvUUqulxNwpJnt5LEptvubG3TWX7OUOI6woCZcQ8L4b8qcPh0X4j6zz
 IuA0/XKh/EVPzjGpK2/OMEYhAwMZppY5O9Wgd1NGC0yE6CRsL63+q0w6NE6Y3fxtLTSzU/JRF
 WR1ZD3y3OdAK8ekogefSZb4ma0qylz3zlEn0GqUCnCam20aifNLus2Q1PWgK/itKAPxVaNIg0
 z3dQBhqYw7E9fUNKT6Gy98zH2VTMzAe8p7h27VZYpmlEg/PY2xtTyKt3DnAlp6fqvL9CFmDT/
 YFd0knsundTUCKzorocmERWgWkzlZ0b9bAKrzNlvN5R1NrlzQstEbbJttWEneI1bDBIHsTmsb
 tC0Ut7YJbJIGndwTLG1qgre0pT50k2ud3JsbxP+SPQmfHUEbdun4zsU8J1kqhmw1ojjY+R/5n
 ymumsBX/7QGaJwWcjiuuns93qdpanPu7I4JT8mJy3C2zlY93qGb4qJOYbnXDWssTd9fBfCsAh
 PGdytfjR3VvHwUi2q6vPIp4/wD7dOmEG6nooKGGB4L0YGiy8t5i/6KSqXN8i+zjtWZg6fN5wG
 Gzhd5RSBS0DrhbFZZfFUHr0HDsrTztHmadWYnyNMrcg/mcl11TTUrjxw==
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1559827349;
 bh=3GgRE/7gk1yOPllVBPwhjW/tx18nLQL+X62wfUBb3bQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=kQkd9UgLhqgOGzoPE/qwMtrpB09fGGCtcr8IaB6u0ChxB1buNZiC7A9/Vo2DpfIN5
 TgDpyPup4EctUYPAJp3En0dsjpRSSgQYtYZ8yDXkE1A9vtUuTYfpXlaDpvXY6gAWCL
 4thZSAJAtMMopUPDwaVDaEnzMwXV7aWW+4oGiRMg=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1924262001=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1924262001==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>
<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span lang="EN-US" style="font-size:10.0pt"><span style="font-family:&quot;Verdana&quot;,sans-serif">Hi,</span></span></span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">We observed the following error on an i.MX6D+ CPU during start of X. As a result, the screen goes blank.</span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">-------</span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">[ 3599.200886] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:30:crtc-0] flip_done timed out</span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">[ 3610.080885] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:30:crtc-0] flip_done timed out</span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">[ 3620.320849] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONNECTOR:45:LVDS-1] flip_done timed out</span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">[ 3630.560864] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:28:plane-0] flip_done timed out</span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">-------</span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">The error happens quite randomly but it can be reliably reproduced by repeatedly restarting X . On our system, the error occurs somewhere between 80 and 300 restarts of X.</span></span></p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">We first observed the issue using kernel 4.14.123. Updating to 4.19.48 did not solve the issue unfortunately.</span></span></p>

<p>&nbsp;</p>

<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">Cheers,</span></span></p>

<div><span lang="EN-US" style="font-size:11.0pt"><span style="font-family:&quot;Calibri&quot;,sans-serif">Hannes Moesl</span></span></div>
</div></div></body></html>

--===============1924262001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1924262001==--

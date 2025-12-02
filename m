Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4C6C9BC04
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 15:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A844810E657;
	Tue,  2 Dec 2025 14:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 409 seconds by postgrey-1.36 at gabe;
 Tue, 02 Dec 2025 08:53:32 UTC
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EB710E2D2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 08:53:32 +0000 (UTC)
Received: from [172.25.98.7] (aa04.cngroup.ba.benestra.sk [85.248.43.180])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id EEFC43EA59;
 Tue,  2 Dec 2025 09:46:39 +0100 (CET)
Date: Tue, 02 Dec 2025 09:46:38 +0100
Subject: Re: [PATCH] drm/panel: sony-td4353-jdi: Enable prepare_prev_first
Message-ID: <dda01469-f18f-44c1-9f23-fcb78437c04c@email.android.com>
X-Android-Message-ID: <dda01469-f18f-44c1-9f23-fcb78437c04c@email.android.com>
In-Reply-To: <c15adbf1-ec19-4592-a241-2332d836a3f6@collabora.com>
From: Martin Botka <martin.botka@somainline.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov
 <lumag@kernel.org>, Douglas Anderson <dianders@chromium.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, ~postmarketos/upstreaming@lists.sr.ht, Konrad
 Dybcio <konrad.dybcio@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>
Importance: Normal
X-Priority: 3
X-MSMail-Priority: Normal
MIME-Version: 1.0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Tue, 02 Dec 2025 14:20:13 +0000
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

PGRpdiBkaXI9J2F1dG8nPlJldmlld2VkLWJ5OiBNYXJ0aW4gQm90a2EgJmx0O21hcnRpbi5ib3Rr
YUBzb21haW5saW5lLm9yZyZndDs8L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPjxk
aXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiBEZWMgMiwgMjAyNSA5OjMyIEFNLCBBbmdlbG9HaW9h
Y2NoaW5vIERlbCBSZWdubyAmbHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEu
Y29tJmd0OyB3cm90ZTo8YnIgdHlwZT0iYXR0cmlidXRpb24iIC8+PGJsb2NrcXVvdGUgY2xhc3M9
InF1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29s
aWQ7cGFkZGluZy1sZWZ0OjFleCI+PHAgZGlyPSJsdHIiPklsIDMwLzExLzI1IDIzOjQwLCBNYXJp
am4gU3VpanRlbiBoYSBzY3JpdHRvOiYjMTM7PGJyPgomZ3Q7IFRoZSBEU0kgaG9zdCBtdXN0IGJl
IGVuYWJsZWQgYmVmb3JlIG91ciBwcmVwYXJlIGZ1bmN0aW9uIGNhbiBydW4sIHdoaWNoJiMxMzs8
YnI+CiZndDsgaGFzIHRvIHNlbmQgaXRzIGluaXQgc2VxdWVuY2Ugb3ZlciBEU0kuJm5ic3A7IFdp
dGhvdXQgZW5hYmxpbmcgdGhlIGhvc3QgZmlyc3QmIzEzOzxicj4KJmd0OyB0aGUgcGFuZWwgd2ls
bCBub3QgcHJvYmUuJiMxMzs8YnI+CiZndDsgJiMxMzs8YnI+CiZndDsgRml4ZXM6IDllMTUxMjNl
Y2E3OSAoImRybS9tc20vZHNpOiBTdG9wIHVuY29uZGl0aW9uYWxseSBwb3dlcmluZyB1cCBEU0kg
aG9zdHMgYXQgbW9kZXNldCIpJiMxMzs8YnI+CiZndDsgU2lnbmVkLW9mZi1ieTogTWFyaWpuIFN1
aWp0ZW4gJmx0O21hcmlqbi5zdWlqdGVuQHNvbWFpbmxpbmUub3JnJmd0OyYjMTM7PGJyPgomIzEz
Ozxicj4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vICZsdDthbmdlbG9n
aW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7JiMxMzs8YnI+CiYjMTM7PGJyPgom
IzEzOzxicj4KPC9wPgo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2Pg==


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E22C1935
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 21:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17A96E326;
	Sun, 29 Sep 2019 19:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 456 seconds by postgrey-1.36 at gabe;
 Fri, 27 Sep 2019 17:44:49 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3DE6E198
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 17:44:49 +0000 (UTC)
Received: from [192.168.1.110] ([77.2.115.172]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MYNS0-1ii8If0CHa-00VMuD for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep
 2019 19:32:07 +0200
To: dri devel <dri-devel@lists.freedesktop.org>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: X11 + console switch - how does it actually work ?
Organization: metux IT consult
Message-ID: <45874e71-6a9b-e863-334f-f07f6bd30d64@metux.net>
Date: Fri, 27 Sep 2019 19:32:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:FPkYt7eUbgYN1iAMQLgxem7uuaPkMGz+dXiIpWSMsSBdyAjXQZN
 F9tdseAtKg1LkphsnkEIt7K9QdPvh8pP/JFOK1AgHvghltXp+H8jEgbhIED5xIS3XgkiUPu
 htbh01+hfxXJTjuDDKWn971e/Q7+cY0acBmEWqgWnHLWOZLaFM0zQf0HBGQE4aP5T3uopLr
 bdGjKM1BXx/eRNUx7rsAw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hdysIuJ7S2g=:4YuL9Mvu5CC3c4dZSKVOi8
 GH0v2Xmcj4FkK0A9+Z0FM22c68wY5BczD8BpVWs4EZOu39SFR5FHRVor40e+SA493eKRoH1JU
 EwirdEyPmtVE5fbhLpFI01T0THxREMSiZKpHu9AQgfhAmS7Hyd/TGS1W5NPOykg9Fg7XJtHc/
 e8H8gtRLUwcMtGcxM20UX8Xu9LE8Tfutr3jdQ5/aQp2UQ8U0xmkIWj4pPCtnbXiVqmORQEuLf
 0ak4chCWtCwW3ayfoG6954ZaHdK3g1WBC5xhZ6kPTQejOyL/VDwvOVta5wJ/bFar+er48WMYB
 1TNZRmH2kHqeWr/52FqePN2T9OpXHotjvWuIXaUlaEquGiMefMBIlCh2tWJYQDQBl05jukjxe
 rjowaGrHxBnuRs7Cz6yohwMiMp2H1Kp/fba+LLU5FQYV9GxyTyP/fxXyyeVniSAtZVlpTVFv7
 mtFOhE7RVRFUIk3pLLlbX+2KJ+fYopSvDS0cJkdYsP4vwCk+IPxetXs9ZPADNdqkEc+XE4U/1
 oNW1YIdVorxNce1KRy0njuKYfxElUzeKmsPHwwr6tXu4NdgJghMgMU+E0JTUE7iByt5+bplgy
 d9pqe8VgoQftM0xElhW+XijdX1YSiGvZZ08EsKRZbY+DVU7B4wTuY6oGUboQl9TdgVSYGZcth
 6NCcnd+v1k5NWk+oC2csjKZYOOm57Ul9EGg8CDaPRyqVwFZb7t4dOE4W2KPIjtGoxyTocyDQ6
 xHk2Bpr5z3zQ1F23eo/vWU8qyg5iyBfQvPnyg+2khcQY9kvNZ/7vQzRRKnBwyAGq5AIKom1W0
 pq/pfFCEH/c/OrUCR6UPS/WwUnELjJmVMyhRw4mt8QRtPhXBTmIpSRL/VjyX3mDTeL5n9gJeL
 cKimmBKGTkPk1GK70mtw==
X-Mailman-Approved-At: Sun, 29 Sep 2019 19:47:08 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gZm9sa3MsCgoKY291bGQgYW55Ym9keSBwbGVhc2UgZ2l2ZSBtZSBzb21lIG1vcmUgaW5z
aWdodCwgaG93IHN3aXRjaGluZwpmcm9tIFggdG8gY29uc29sZSAoY3RybCthbHQrZiopIGFjdHVh
bGx5IHdvcmtzID8KCldobyBjYXRjaGVzIHRoZSBrZXlwcmVzcyBldmVudCBhbmQgaW5pdGlhdGVz
IHRoZSBWVCBzd2l0Y2ggPwpUaGUgWHNlcnZlciA/IENvdWxkIHRoaXMgYmUgZG9uZSBpbiB0aGUg
a2VybmVsIChlZy4gd2hlbiBYc2VydmVyCmlzIGhhbmdpbmcpID8KCgotLW10eAoKLS0gCkVucmlj
byBXZWlnZWx0LCBtZXR1eCBJVCBjb25zdWx0CkZyZWUgc29mdHdhcmUgYW5kIExpbnV4IGVtYmVk
ZGVkIGVuZ2luZWVyaW5nCmluZm9AbWV0dXgubmV0IC0tICs0OS0xNTEtMjc1NjUyODcKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C1291FD4
	for <lists+dri-devel@lfdr.de>; Sun, 18 Oct 2020 22:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA756E89E;
	Sun, 18 Oct 2020 20:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Sun, 18 Oct 2020 20:32:45 UTC
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41F36E89E
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 20:32:44 +0000 (UTC)
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com
 [51.89.119.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 6ACF9200A0F3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 20:26:36 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Oz9KDr4V"
Date: Sun, 18 Oct 2020 20:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
 t=1603052791; bh=fSCzWHwiRd7pVn7cIfc+r0HFiuIuE4EJJbeT7QKygKw=;
 h=Date:To:From:Reply-To:Subject:From;
 b=Oz9KDr4Vv0NhSrFERhET0ijw3tjqftxDMyEdGQ1jjB0yjKSiL4VjB+sCRfFMnaZr1
 7dVfFxrbBtGHY/E/TeBFcvrmyY9raIQ9wFDld0Hmk9bqEmLg0+SzpfBBRQ4ErnRlMy
 vjnK/H0WWJru/SGUifvWWkm8Z4AGJmvuJXj4aVXh5QVtOWJFpIeBUfbFej5vOo89Mk
 2xU8luHPjZI9StB4hqyC5X3olip+QGNQKvqnxXPevI5vGQyxBphaMTmbeLa/RHmvTh
 7eb+3DG6IawViZ9OQyk6eNBEikm3bzLkp63o74VFMzPjTSpKi/45Sv9Wj5PAFEsLmL
 RlaL6KDlDNSZg==
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Josh Fuhs <Joshua.Fuhs@pm.me>
Subject: amdgpu: Manual Card Configuration Change
Message-ID: <-II5uGU2OLUvxeRHxuPIMmnyrFPVyg6pkc2UM16KaQ5f6_kbDJN0se2tfgIf15RJLLKrWZg0niAIgXxr-0V7qBQGR9mPq306qamxuQq9q7M=@pm.me>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Josh Fuhs <Joshua.Fuhs@pm.me>
Content-Type: multipart/mixed; boundary="===============1126582379=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.

--===============1126582379==
Content-Type: multipart/alternative;
 boundary="b1_mwcqR2Mj4g941QuSDmMBcb5wbgRh6gvGwG20zs"

This is a multi-part message in MIME format.

--b1_mwcqR2Mj4g941QuSDmMBcb5wbgRh6gvGwG20zs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGVsbG8gYWxsLAoKUmVnYXJkaW5nIGFtZGdwdSwgSSd2ZSBiZWVuIHVzaW5nIHNvbWUgUmFkZW9u
IDU3MDBYVHMgZm9yIGNvbXB1dGUgd29yayB3aXRoIGtlcm5lbHMgdGhyb3VnaCA1LjguMTQuIEkg
cmVjZW50bHkgdHJpZWQga2VybmVsIDUuOS4wLCBhbmQgZm91bmQgdGhhdCB0aGUgZm9sbG93aW5n
IGlzIG5vIGxvbmdlciBhbGxvd2VkOgoKZWNobyAibSAxIDIwMCIgfCBzdWRvIHRlZSAvc3lzL2Ns
YXNzL2RybS9jYXJkMC9kZXZpY2UvcHBfb2RfY2xrX3ZvbHRhZ2UKCklzIHRoaXMgYW4gZXhwZWN0
ZWQgY2hhbmdlPyBJZiBzbywgd2hlcmUgc2hvdWxkIEkgbG9vayBmb3IgZG9jdW1lbnRhdGlvbiBy
ZWdhcmRpbmcgaG93IHRvIG1hbnVhbGx5IGNvbmZpZ3VyZSB0aGVzZSBjYXJkcyB3aXRoIHRoaXMg
a2VybmVsLiBOb3RlLCBJJ3ZlIGhhZCB0aGlzIHdvcmtpbmcgd2l0aCA1Ljgga2VybmVscyBmb3Ig
bW9udGhzLgoKVGhhbmtzCgpKb3No

--b1_mwcqR2Mj4g941QuSDmMBcb5wbgRh6gvGwG20zs
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdj48ZGl2PkhlbGxvIGFsbCw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5SZWdhcmRp
bmcgYW1kZ3B1LCBJJ3ZlIGJlZW4gdXNpbmcgc29tZSBSYWRlb24gNTcwMFhUcyBmb3IgY29tcHV0
ZSB3b3JrIHdpdGgga2VybmVscyB0aHJvdWdoIDUuOC4xNC4gSSByZWNlbnRseSB0cmllZCBrZXJu
ZWwgNS45LjAsIGFuZCBmb3VuZCB0aGF0IHRoZSBmb2xsb3dpbmcgaXMgbm8gbG9uZ2VyIGFsbG93
ZWQ6PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+ZWNobyAibSAxIDIwMCIgfCBzdWRvIHRl
ZSAvc3lzL2NsYXNzL2RybS9jYXJkMC9kZXZpY2UvcHBfb2RfY2xrX3ZvbHRhZ2U8YnI+PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5JcyB0aGlzIGFuIGV4cGVjdGVkIGNoYW5nZT8gSWYgc28sIHdo
ZXJlIHNob3VsZCBJIGxvb2sgZm9yIGRvY3VtZW50YXRpb24gcmVnYXJkaW5nIGhvdyB0byBtYW51
YWxseSBjb25maWd1cmUgdGhlc2UgY2FyZHMgd2l0aCB0aGlzIGtlcm5lbC4gTm90ZSwgSSd2ZSBo
YWQgdGhpcyB3b3JraW5nIHdpdGggNS44IGtlcm5lbHMgZm9yIG1vbnRocy48YnI+PGJyPlRoYW5r
czxicj48YnI+Sm9zaDwvZGl2PjwvZGl2PjxkaXY+PC9kaXY+PGRpdiBjbGFzcz0icHJvdG9ubWFp
bF9zaWduYXR1cmVfYmxvY2sgcHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2stZW1wdHkiPjxkaXYg
Y2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLXVzZXIgcHJvdG9ubWFpbF9zaWduYXR1
cmVfYmxvY2stZW1wdHkiPjxicj48L2Rpdj48ZGl2IGNsYXNzPSJwcm90b25tYWlsX3NpZ25hdHVy
ZV9ibG9jay1wcm90b24gcHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2stZW1wdHkiPjxicj48L2Rp
dj48L2Rpdj48ZGl2Pjxicj48L2Rpdj4=


--b1_mwcqR2Mj4g941QuSDmMBcb5wbgRh6gvGwG20zs--


--===============1126582379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1126582379==--


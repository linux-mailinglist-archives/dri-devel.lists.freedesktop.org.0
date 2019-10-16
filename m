Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D9ADCE29
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC7E6EB99;
	Fri, 18 Oct 2019 18:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net
 [194.109.24.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166796E97E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 13:39:24 +0000 (UTC)
Received: from tschai.fritz.box ([46.9.232.237])
 by smtp-cloud8.xs4all.net with ESMTPA
 id KjWGiHz9CPduvKjWKirEmL; Wed, 16 Oct 2019 15:39:22 +0200
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv8 0/2] drm: tda998x: use cec_notifier_conn_(un)register
Date: Wed, 16 Oct 2019 15:39:14 +0200
Message-Id: <20191016133916.21475-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfE2wvjBYiAvhFfBUXuFE0uMfRS1MwR8IivP7xwmNNc/ArZH/TjkyUtk5waN0KoBCfZzKcT5iPgx+6XudQezFQaB/S9MyqEhsb++uoaDd2B1kVEYo2sVs
 F/xRpiagZmJcyfwQwp4ka3NOP9cdsmjRLOPnlxtTFRIPE3bj0JPZsErnRUKOCg2OngAnulh2mvs5DD9iCu1/ThVD52Idx8c5gbjgMQGg3YT5yFdoRPeVfJmD
 uJuNkJoSh3IbnO67SKMI5b6u3BGSQwOP8PtN0/QTw0CezN5F4OWM4PjeE8LVvoePR71TZkmfRPYuLkf0BL2ka3NA4hMk6q7DJ4nb6pQHtmNqxsMb/KqsTeaf
 p6+Ut512G8F19k3azUMSVq3xQ7QXHg==
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
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
Cc: Dariusz Marcinkiewicz <darekm@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzcGxpdHMgdGhlIHByZXZpb3VzIHY3LjIgcGF0Y2ggKDEpIGludG8gdHdvIHBhcnRzOiBv
bmUgdGhhdCByZXBsYWNlcwpjZWNfbm90aWZpZXJfZ2V0L3B1dCBieSBjZWNfbm90aWZpZXJfY29u
bl8odW4pcmVnaXN0ZXIsIGFuZCBvbmUgdGhhdApzZXRzIHRoZSBjb25uZWN0b3IgaW5mby4KClRo
YXQgc2Vjb25kIHBhdGNoIG1vdmVzIHRoZSBDRUMgbm90aWZpZXIgY29kZSB0byB0ZGE5OTh4X2Jy
aWRnZV9kZXRhY2gsCmJ1dCBMYXVyZW50IGlzIG1ha2luZyBjaGFuZ2VzIGluIHRoYXQgYXJlYSBh
bmQgcHJlZmVycyB0aGF0IHRoaXMgaXNuJ3QKaW1wbGVtZW50ZWQgeWV0LgoKQnV0IHRoZSByZXBs
YWNlbWVudCBvZiB0aGUgY2VjX25vdGlmaWVyX2dldC9wdXQgZnVuY3Rpb25zIGlzIHNvbWV0aGlu
Zwp0aGF0IG5lZWRzIHRvIGJlIGZpbmlzaGVkIGZvciB2NS41LgoKQnkgc3BsaXR0aW5nIHRoaXMg
cGF0Y2ggdXAgSSBjYW4gbWVyZ2UgdGhlIGZpcnN0IGhhbGYsIGJ1dCBkZWxheSB0aGUKc2Vjb25k
IGhhbGYuIFRoaXMgdGRhIGRyaXZlciBqdXN0IHdvbid0IGJlIGFibGUgdG8gcmVwb3J0IHRoZSBj
b25uZWN0b3IKaW5mb3JtYXRpb24gaW4gdGhlIG1lYW50aW1lLgoKUmVnYXJkcywKCglIYW5zCgoo
MSkgaHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcGF0Y2gvNTg0NjQvCgpEYXJpdXN6IE1h
cmNpbmtpZXdpY3ogKDIpOgogIGRybTogdGRhOTk4eDogdXNlIGNlY19ub3RpZmllcl9jb25uXyh1
bilyZWdpc3RlcgogIGRybTogdGRhOTk4eDogc2V0IHRoZSBjb25uZWN0b3IgaW5mbwoKIGRyaXZl
cnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMo
LSkKCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==

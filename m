Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6FC293271
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 02:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E352A6EE51;
	Tue, 20 Oct 2020 00:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 102433 seconds by postgrey-1.36 at gabe;
 Tue, 20 Oct 2020 00:53:46 UTC
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C81A6EE51
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 00:53:45 +0000 (UTC)
Date: Tue, 20 Oct 2020 00:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
 t=1603155223; bh=LgALgR4MRmvmRN5k/EEis0U/JvVFZ45pZ8o/wjnkZw8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=HOtoFolxlkdGoTBpFRNCZxCvwKvpwbF/m3dWDEvcA3Z/Q2WL6ZI4Pk3jFdyYIzByg
 xUEJ3QF0Pt2ewrYjJylEHYqzDJePRrK2f07dc02k0Xg9I5E/tNEiBJr65DFq/Q5tVh
 MC/r7A7dQRjebKyUxaH6BIUF1+7w8K2lD4cSzfyekfalk1atn6hBsyec0XS+FVfWkI
 8n8HhVciI0fomRg0pHl9Vd5ofFwcasPSXiMygjzLXxiVR0mZMEc/oYbDVpY5NXBuqV
 kwS4Np574okifwkndGacAhPJzMarveGwtLJp8+qRgvk+Ps0LlHDAqPD0ipizWL/L9K
 rDwfV8Y5k3t3Q==
To: Alex Deucher <alexdeucher@gmail.com>
From: Josh Fuhs <Joshua.Fuhs@pm.me>
Subject: Re: amdgpu: Manual Card Configuration Change
Message-ID: <rfi6blr6iZOO9U7GHVXPZVcbAxN21dh52TEK19odIK5sxSI3JiOSKEowBQqN97pJcTkgV8nFzG_d70g9-x1swBX-7kQ-ZqTme73yCbXgIm4=@pm.me>
In-Reply-To: <CADnq5_M+qgk7p92daoUMNN-OaoXKeTWULUQiivGe=V_J4e1oqA@mail.gmail.com>
References: <-II5uGU2OLUvxeRHxuPIMmnyrFPVyg6pkc2UM16KaQ5f6_kbDJN0se2tfgIf15RJLLKrWZg0niAIgXxr-0V7qBQGR9mPq306qamxuQq9q7M=@pm.me>
 <CADnq5_M+qgk7p92daoUMNN-OaoXKeTWULUQiivGe=V_J4e1oqA@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzLiBJIHRyaWVkIDUuOS4xIGFuZCBJIHRoaW5rIHRoZXJlJ3Mgc3RpbGwgYSBwcm9ibGVt
LCBvciBhdCBsZWFzdCBzb21ldGhpbmcgZGlmZmVyZW50LgoKVXNpbmcgdGhlIHNhbWUgY29uZmln
dXJhdGlvbiBzY3JpcHQsIEkgbm90aWNlZCB0aGF0IG15IGNhcmRzIGFyZSBydW5uaW5nIGEgbG90
IGhvdHRlci4gRm9yIGV4YW1wbGUsIGhlcmUncyB0b3RhbCBwb3dlciBjb25zdW1wdGlvbiBvZiBh
IHR3by1jYXJkIHN5c3RlbSB3aXRoIHR3byBkaWZmZXJlbnQga2VybmVsczoKCiAgICA1LjguMTQ6
IDQ2MFcKICAgIDUuOS4xOiAgNTYwK1cKCk1lbW9yeSBhbmQgc3lzdGVtIGNsb2NrcyBhcmUgaW5p
dGlhbGx5IHNldCB0aGUgc2FtZSBvbiBhbGwgY2FyZHMgaW4gYWxsIGNhc2VzLgoKSm9zaAoKCuKA
kOKAkOKAkOKAkOKAkOKAkOKAkCBPcmlnaW5hbCBNZXNzYWdlIOKAkOKAkOKAkOKAkOKAkOKAkOKA
kApPbiBNb25kYXksIE9jdG9iZXIgMTksIDIwMjAgMjoyMiBQTSwgQWxleCBEZXVjaGVyIDxhbGV4
ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOgoKPiBPbiBTdW4sIE9jdCAxOCwgMjAyMCBhdCA0OjMy
IFBNIEpvc2ggRnVocyBKb3NodWEuRnVoc0BwbS5tZSB3cm90ZToKPgo+ID4gSGVsbG8gYWxsLAo+
ID4gUmVnYXJkaW5nIGFtZGdwdSwgSSd2ZSBiZWVuIHVzaW5nIHNvbWUgUmFkZW9uIDU3MDBYVHMg
Zm9yIGNvbXB1dGUgd29yayB3aXRoIGtlcm5lbHMgdGhyb3VnaCA1LjguMTQuIEkgcmVjZW50bHkg
dHJpZWQga2VybmVsIDUuOS4wLCBhbmQgZm91bmQgdGhhdCB0aGUgZm9sbG93aW5nIGlzIG5vIGxv
bmdlciBhbGxvd2VkOgo+ID4gZWNobyAibSAxIDIwMCIgfCBzdWRvIHRlZSAvc3lzL2NsYXNzL2Ry
bS9jYXJkMC9kZXZpY2UvcHBfb2RfY2xrX3ZvbHRhZ2UKPiA+IElzIHRoaXMgYW4gZXhwZWN0ZWQg
Y2hhbmdlPyBJZiBzbywgd2hlcmUgc2hvdWxkIEkgbG9vayBmb3IgZG9jdW1lbnRhdGlvbiByZWdh
cmRpbmcgaG93IHRvIG1hbnVhbGx5IGNvbmZpZ3VyZSB0aGVzZSBjYXJkcyB3aXRoIHRoaXMga2Vy
bmVsLiBOb3RlLCBJJ3ZlIGhhZCB0aGlzIHdvcmtpbmcgd2l0aCA1Ljgga2VybmVscyBmb3IgbW9u
dGhzLgo+Cj4gSXQgd2FzIGEgYnVnLiBGaXhlZCBpbiA1LjkuMS4KPgo+IEFsZXgKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

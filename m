Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2232627CA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FED6E9C4;
	Wed,  9 Sep 2020 07:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6B56E1E5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 15:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1599580056;
 bh=ZjHwRcLadiIjiSw+7kpC3pYHJ5r+CWdRknB7dCwEnw0=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=DXawYAFdyL865zIx8/TLwpYLTSqOH3LAt5CNIQuawvyzRi201ZOZkwllWBXpOKwJz
 WSiVk1+2VWaIp7VnWU6GfmrFHRMhZrQI7Bm46O3enbebunWlB3TXul1HxqwI51VXTU
 HTYSLJG4nlW228sJo7XwQXQduS/4c9V4uoJuqXbc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.47.17]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LgYG1-1krjgr1xWH-00nv6B; Tue, 08
 Sep 2020 17:47:36 +0200
To: "Alejandro W. Sior" <aho@sior.be>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gvt: Fix NULL pointer dereference in
 intel_vgpu_reg_rw_edid()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <743818af-fa38-e31a-1780-84a6a7e72e25@web.de>
Date: Tue, 8 Sep 2020 17:47:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:scBQBKrokmZiRIZKlYXynhTyOygqkZy1271KANblHr6I/MmtVEU
 6ab1qRyXBC9s8LsImOfJutJjbcWVRb02kmVe1R5A1EDrsmc1TQ8V8Rcskm1Inltpkc3DLCY
 8HlHRw7mpf6s6MwN3w8m8fnuhNUt3msz+S3H5WHU/f9Ynx5L2NiLk0nwaYVjGYKAGclWdxW
 YfXxkiCiW0t1bOAJ1agtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:67thlYqKDgc=:FciJcTe6WnbTONIzzw16fP
 3Z/oCXNa5y8MI7fcRaQKh/a6F9FU8dTLzbu53zQZCJIMKsogwILWeyfiRDeuyluSIHylHncb1
 UwtZXdOaDk3zNc1jLJJXoPvNk9mvsyS8B0jI62UQTmrSQ39WB7ZOmCeEjq6cl5Ue0XsDobc8z
 6tpZibnVga8vQ3G3FwoSS6/nMND6x90MGVJWGbcenXRcV9K8La2u+hjsd6ku/PsE0fqhpvBwZ
 A34h0svmp1ONJyZP6/Rgjo5AzNnRRrB961R1Wm65apRBsBZwSe6x5Dmk4gFFqhtOYiGJRUJgH
 frFpngXQ5swi0bdE+2aRFJe5WSKkTXq5MtxIv6y0bbKVTi9XKrajFi3IVDdBxgYVIBW7wfmyq
 Sk+LwTuJGlGP+Y4rR4dTEuREwiJNpTZGRangrV4lg8J1DHmKV7bfcbYR1aVvI+YTlOxvQfMWg
 V8TCqGpJnAyOh2Y0ES4vovrn1JHjjxSEYccz9g2SblJ9PeWnmAvC3rxfnVjNIdkhucdS5v34y
 Od3hqB2u+PKlKFjOn0D2ulvFtU47+uPpmk0DO2eT3ogEuxcSXNbgv8pG+bnxkNtfnyfFV2FbS
 rOBA1CmWhTT10TBCHOqKDaG3g7ZrD1Am6S6uF+4cfQSeTLI6J0IcR2/aO08UMeTDfQAusNLHm
 qpYLHV79eU5QbeUy/JuqdvE9TU4LjXo7TP3WAHJ3nMzc89o9eJu/8dbDGHd4TpjMgJDoh8Eg0
 LT81ITARvtrvQa35jNU4lBYdq46FAFLYWANvg+AuanKoUHDXSohDq9qtvhf75Z+pN83OQjk2V
 oh5fIyz2UxblMjVJdHSvc05NdwrCbCtUeBDna39f5KDY4ISS/h8JU5c3Rkj5alqzO4yhnARnS
 3HvmsNV13N9XrV/Nmsia/VutcvfrL9hAnsNHrLJzOoJ+tbgsjY1I3JR5WXXR3f+g6/NY4lXfq
 tKh5PzvpAlIPS+Be3v1MCPf9OhRqDHRKlELPzAEFydhLk4KasSy9qMAQs6Iwo6J/HnmxuTG8c
 5Xer4ehAvLZVrFcDy7a7bfElHYn8tx6GHd/eZf04Eu+4AyR+EnvYcsy1DPRDWeAgDHkzOHFTn
 POxBc0/kLS+D1OpvGdroYWEH1G2jKGnwLtLep2JAeGQUJRv5iGd5uEejoIHh0GdLPTtOD+ZLm
 N12Pa5h3Pajbn12KudWAmj7KuBrDybCRnFsv4v4CwLgwJWqJZ3q7y4n4CvLHNZjMN8WHUo8Ne
 NeDpXOvtIcgR1NNfHImKf0rmo+UF3hypMtoxXQQ==
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBJbiB0aGUgZnVuY3Rpb24gaW50ZWxfdmdwdV9yZWdfcndfZWRpZCBvZiBndnQva3ZtZ3QuYywg
cG9zIGNhbiBnZXQgZXF1YWwgdG8gTlVMTCBmb3IgR1BVcyB0aGF0IGRvIG5vdAo+IHByb3Blcmx5
IHN1cHBvcnQgRURJRC4g4oCmCgoqIEkgcHJvcG9zZSB0byByZWNvbnNpZGVyIHRoZSBwcmV2aW91
cyBwYXRjaCBzdWJqZWN0IG9uY2UgbW9yZS4KCiogRGlkIHRoZSBzY3JpcHQg4oCcY2hlY2twYXRj
aC5wbOKAnSBwb2ludCBhbnkgYWRqdXN0bWVudCBwb3NzaWJpbGl0aWVzIG91dAogIGZvciB0aGUg
Y2hhbmdlIGRlc2NyaXB0aW9uPwoKCj4gVGhpcyBwYXRjaCBzb2x2ZXMgdGhpcyBwcm9ibGVtIGJ5
IOKApgoKV291bGQgYW4gaW1wZXJhdGl2ZSB3b3JkaW5nIGJlIHByZWZlcnJlZCBmb3IgdGhlIGNv
bW1pdCBtZXNzYWdlPwpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0
dGluZy1wYXRjaGVzLnJzdCNuMTUxCgoKPiDigKYgdG8gYSBuYWdhdGl2ZSB2YWx1ZSwg4oCmCgpQ
bGVhc2UgYXZvaWQgYSB0eXBvIGhlcmUuCgoKSSBzdWdnZXN0IHRvIGFkZCB0aGUgdGFnIOKAnEZp
eGVz4oCdIHRvIHRoZSBjb21taXQgbWVzc2FnZS4KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67D4F8A3B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 09:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1B06EA66;
	Tue, 12 Nov 2019 08:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [194.109.24.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD006E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 13:55:25 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud9.xs4all.net with ESMTPA
 id UA9fiVFfsQBsYUA9ki6cYM; Mon, 11 Nov 2019 14:55:18 +0100
Subject: Re: WARNING in dma_buf_vunmap
To: syzbot <syzbot+a9317fe7ad261fc76b88@syzkaller.appspotmail.com>,
 andy@greyhouse.net, davem@davemloft.net, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, j.vosburgh@gmail.com, kyungmin.park@samsung.com,
 linaro-mm-sig-owner@lists.linaro.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 m.szyprowski@samsung.com, maheshb@google.com, mchehab+samsung@kernel.org,
 mchehab@kernel.org, netdev@vger.kernel.org, pawel@osciak.com,
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com,
 tfiga@chromium.org, vfalico@gmail.com
References: <000000000000d2c94e0596c1d47b@google.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5ed667c7-36ee-466c-7f6d-cd52ccb71c28@xs4all.nl>
Date: Mon, 11 Nov 2019 14:54:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <000000000000d2c94e0596c1d47b@google.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfOVyIXaOdZqyrZFAcLrvkaNOhPcmisjimCJz25F9XwmH9nD5lWqPr+Wf1+q27L8QJeRigdxxQPwscLrsW01Py/OJfmCjP6ls8p7ZDuOLtAyj6LtYfqLk
 AGRud3HQKuid40ueqTwCHVZluw0DxJ4VCYZI5TOBG06jns6XG0xc4cCKVQeiZ5LW6sIY14VK9AUSjSSwPdwAYNrBVlU6u4UUhb7+vY1jcwy5zHGHGD62hHDX
 1aMHRhXeUCtUmVi6U/6rKqXY4/aOgyChPds2EMDB5CRUX9FmoAw9NKkwVF5Vl354yBFw2J/TF3mj1nOXFRApFc4tck43MoqHD3Vck0FekoeF4cqBjCOmAo+r
 1Hbxl0GcagIo0Rnsu0SKz8KvFBWY1f0V/XQpgk1Jd+zuzdDtECNNuD1EaOzqtXnnBzjCc6RWZaPoOVRuErgusCtdnLWvDpeN5H2YpoyMhvZoubK0Lj96TzZ7
 MB7n5u6rCAzB/XbpaldT4dUTqj7eQBVElUCg71RpVuet68YMPNbvPaM9e2vB092mqgUQRG4ufzJ61GHsGKhQn54duhF/7Ve23frFlgwcxN5pdPEpeU+sT5ix
 DzIunwN828xBm6v7P/W5A/PQa50xNq2hdKND0Qxxc/K/RgR9C11emf5X4FBn1gUWdvzAhuxYE9+adGq2wGUOC5+lUFqRXfTavXd6CBSPftfMf3LF9MngJOlI
 xAK9gMhtdlJsJPZspCDsPfQVWn6U+Wn9mNEikBsXTBLDjbeGI0TTgtetuSNuahWHEl9LLGOHi2333/yekdP03Pysh23Mt7HCUE5/cDQHMUatEkqZNw3Ucc1K
 iOV3ggiTx5oK46cuTRt1qg0FTx96jylWsG0PNnGhU2lDyMCElFc55pf/6MoChq8dKuAtWGED+fkTRREvoWLp+TvXMEhOwG9rPpXLK4XjoyrrJDIOdyX01o6m
 8MjInQ==
X-Mailman-Approved-At: Tue, 12 Nov 2019 08:13:33 +0000
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

I3N5eiBmaXg6IG1lZGlhOiB2YjI6IGNoZWNrIG1lbW9yeSBtb2RlbCBmb3IgVklESU9DX0NSRUFU
RV9CVUZTCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E531AEBEFA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A356F760;
	Fri,  1 Nov 2019 08:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2435F6F665
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 22:12:25 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52])
 by out01.mta.xmission.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1iQIg0-0007kM-Ml; Thu, 31 Oct 2019 16:12:20 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in02.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1iQIfz-0005t2-OP; Thu, 31 Oct 2019 16:12:20 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Joe Perches <joe@perches.com>
References: <20191029182320.GA17569@mwanda>
 <87zhhjjryk.fsf@x220.int.ebiederm.org> <20191030074321.GD2656@xps-13>
 <87r22ujaqq.fsf@x220.int.ebiederm.org> <20191030201201.GA3209@xps-13>
 <734ef2833e4e4e7bded92e9d964bc2415aadf3c4.camel@perches.com>
Date: Thu, 31 Oct 2019 17:12:10 -0500
In-Reply-To: <734ef2833e4e4e7bded92e9d964bc2415aadf3c4.camel@perches.com> (Joe
 Perches's message of "Thu, 31 Oct 2019 11:16:39 -0700")
Message-ID: <87ftj8k1j9.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1iQIfz-0005t2-OP; ; ; mid=<87ftj8k1j9.fsf@x220.int.ebiederm.org>;
 ; ; hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+Wj6J2YX8vDTKT+N1A+xx3aEijyjCXou4=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa08.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=8.0 tests=ALL_TRUSTED,BAYES_40,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
 T_TooManySym_02,XMSubLong autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -0.0 BAYES_40 BODY: Bayes spam probability is 20 to 40%
 *      [score: 0.3405] *  0.7 XMSubLong Long Subject
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa08 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa08 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Joe Perches <joe@perches.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 521 ms - load_scoreonly_sql: 0.05 (0.0%),
 signal_user_changed: 5 (1.0%), b_tie_ro: 3.6 (0.7%), parse: 1.08
 (0.2%), extract_message_metadata: 12 (2.3%), get_uri_detail_list: 0.87
 (0.2%), tests_pri_-1000: 6 (1.1%), tests_pri_-950: 1.39 (0.3%),
 tests_pri_-900: 1.20 (0.2%), tests_pri_-90: 25 (4.9%), check_bayes: 23
 (4.5%), b_tokenize: 4.6 (0.9%), b_tok_get_all: 9 (1.7%), b_comp_prob:
 1.69 (0.3%), b_tok_touch_all: 5 (1.0%), b_finish: 1.00 (0.2%),
 tests_pri_0: 456 (87.6%), check_dkim_signature: 0.48 (0.1%),
 check_dkim_adsp: 2.8 (0.5%), poll_dns_idle: 1.19 (0.2%), tests_pri_10:
 2.5 (0.5%), tests_pri_500: 7 (1.3%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] fbdev: potential information leak in do_fb_ioctl()
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
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
Cc: linux-fbdev@vger.kernel.org, security@kernel.org,
 Kees Cook <keescook@chromium.org>, Julia Lawall <Julia.Lawall@lip6.fr>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrea Righi <andrea.righi@canonical.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4gd3JpdGVzOgoKPiBPbiBXZWQsIDIwMTktMTAt
MzAgYXQgMjE6MTIgKzAxMDAsIEFuZHJlYSBSaWdoaSB3cm90ZToKPj4gVGhlbiBtZW1zZXQoKSAr
IG1lbWNweSgpIGlzIHByb2JhYmx5IHRoZSBiZXN0IG9wdGlvbiwKPj4gc2luY2UgY29weWluZyBh
bGwgdGhvc2UgZmllbGRzIG9uZSBieSBvbmUgbG9va3MgcXVpdGUgdWdseSB0byBtZS4uLgo+Cj4g
QSBtZW1zZXQgb2YgYW4gYXV0b21hdGljIGJlZm9yZSBhIG1lbWNweSB0byB0aGUgc2FtZQo+IGF1
dG9tYXRpYyBpcyB1bm5lY2Vzc2FyeS4KCllvdSBzdGlsbCBuZWVkIHRvIGd1YXJhbnRlZSB0aGF0
IGFsbCBvZiB0aGUgaG9sZXMgaW4gdGhlCnN0cnVjdHVyZSB5b3UgYXJlIGNvcHlpbmcgYXJlIGlu
aXRpYWxpemVkIGJlZm9yZSB5b3UgY29weSBpdC4KCk90aGVyd2lzZSB5b3UgYXJlIGp1c3QgY2hh
bmdpbmcgd2hpY2ggdW5pdGlhbGl6ZWQgbWVtb3J5IHRoYXQKaXMgYmVpbmcgY29waWVkIHRvIHVz
ZXJzcGFjZS4KCldoaWNoIGlzIG15IGNvbmNlcm4gd2l0aCB5b3VyIHZlcnkgc2ltcGxlIHN1Z2dl
c3Rpb24uCgpFcmljCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=

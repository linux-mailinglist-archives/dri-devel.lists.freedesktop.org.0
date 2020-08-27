Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB1225553B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3719A6E455;
	Fri, 28 Aug 2020 07:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD316E447;
 Thu, 27 Aug 2020 14:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1598537316;
 bh=Lr53Bx7PyfSJQkEf7GuaGcE+Pk2zhRa+Dtri+EV6dUE=;
 h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
 b=Fy40yltLHxxCeu2L1P5AU2mCBoB2Y4SBoVNESCtJTeD78lvaA144WmzyvUDLYeoDC
 Z6R62TgZYBMly9EQArLOloKtyGTmX0B7m7O6iN4SexAE7MrEjGSDxBiEi/Cvwb0EQY
 WzNljk7uxvPPVbKXO6BUUCt+mziEq49tPenBhT78=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.99.195]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MEmoQ-1kQ5M62aNe-00Fx75; Thu, 27
 Aug 2020 16:08:36 +0200
Subject: Re: [PATCH] drm/amd/display: Fix memory leak in
 amdgpu_dm_mode_config_init()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To: Dinghao Liu <dinghao.liu@zju.edu.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <Roman.Li@amd.com>,
 Stylon Wang <stylon.wang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Message-ID: <b12266c7-0c15-ce1a-fe74-a3b546f635a6@web.de>
Date: Thu, 27 Aug 2020 16:08:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:ncOZQeh3ypp19xhmPf66R98DkWvBoQFbDF9x0TcXLJmqYcRKksy
 nPhvQGsuAnfuciPxHFSd7lcle+i0Jk9YgH2JIiCHhlRF1GoVEOe+yb6exw+2ygZgIXbllpU
 BPZmyxZGN61WmKeFnPyF7l/r7cpDN15Qv2oSlGP6h1AlXk0ACrXLsgkLXXuGcAAd929YQi8
 VhbWJJ/+ExqldJ26W/IbQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FgRKn0aJVTw=:NZwK+ygLgWw6f7GLJonLs4
 YmST64Mv6F9VDPyglxHGHjaaTJotpoo7uXHib8OmEPYvbur0HvOQg2qFhyppLDH3GmU2lfvKN
 GGEx3WiDjGbolivS5ZVylWYZZLEYq7Bt6QIvxld80bBJxpZR1qaQ56dkaNDZr9HKbjtcSlN6B
 dlhiAc5O9qA7T051lQbQiYOJ74kmsTEdhX79OBi3B1YIhY0HD1fvWJ5z8LiugtIpnYO3tg89D
 xXRQcJEaFwD1opApiOfYENtENXJw/eOraB+UouBtXkeb6Qwx7/jMN1OYSBLmlA86gNJqQVLN8
 JvGTKNwO/CFEFaJZQ7X1HeDv5t9sub3I6UvRvY1qjnmEUKw36l5ycPdhFTF6PzW+YacCjoZJh
 jcbbURXZCwyeW6oQz4OGCxtvdPH7ounbZsLkdKYvEQi/JOwZ1WPpTdbnUeLU8sJyca6i1W7GN
 E/NyABscItzSWg8P9K6lrb4K92vq1PB8/694aC5/+tL+FDA48otqq/IXaxkDbAuZmfilLwvX2
 I9fiHkavZcCrBTG7eYrEgGx+kReHlCqfnm0pwawJhOtpu6Fz9ok94fmtVTxsFk1RD9XBZ82Xg
 rLYBgsT2+uron/fgdanGwpT41OFen6qWnKKtTpbSAxnK92E74lOoM3UERpBy/5tGVKvz2tqE2
 wAPMlJnsP14WeuPIKlfe+Nhmeyc+ImKuR5ddUbR6YYs4tU7LJ7FD7X+n3JyQAXJw2fzz8iN+j
 GaoUx9IQWTthu9KGIujzFkTdLQd8RQjDgBlHZRpE3mR9MF7lVts7Sd4pEFa7B/pe47gVZ0rUi
 XKDhpH+n+nxAfvdkFUJDSAUcFSqx3evh47pT4FJdncu+VP9n4vUdBH2E+tKeaMMHcO9GWqjty
 Olf9uFlB2baTVFxnrIvkTAgP3EjCPdfAvuHCKNBRfURqEQhfufl3O+wFDK7Wwc019Qpy2tukv
 L7KXukoDxi84DB5OCEZqzVlbr2UOvuXbuy3Ep1lHDQ/lBb0648tad7Y3Vt/B6wBGYiGol/PF5
 +cw8/3YKEEEst9wKtGhvpK4eqW2dW498MF+FM+jA0mN3RKyteb+j9e+Rg6FETmalHAB0FgXTK
 kGg1zs/MhFv8T9AFH/ISJ/Mf2J8/AiOq9oMt7R4AaIvcM95U4pWtT6b6dS8Ey6W+v+a6YCyOr
 MYHzgqhvothZ3kvD7+3aN9LPsORDc1FdXv8OnMRMy+k+R8rqPpGKYoT/9+Up5HyFOEj41J/ub
 WwVTEl1sDgE8ccZn8XgWP92GhgikhIdIb+YE4sQ==
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBXaGVuIGFtZGdwdV9kaXNwbGF5X21vZGVzZXRfY3JlYXRlX3Byb3BzKCkgZmFpbHMsIHN0YXRl
IGFuZAo+IHN0YXRlLT5jb250ZXh0IHNob3VsZCBiZSBmcmVlZCB0byBwcmV2ZW50IG1lbWxlYWsu
IEl0J3MgdGhlCj4gc2FtZSB3aGVuIGFtZGdwdV9kbV9hdWRpb19pbml0KCkgZmFpbHMuCgoqIENh
biBhbm90aGVyIGltcGVyYXRpdmUgd29yZGluZyBiZWNvbWUgaGVscGZ1bCBmb3IgdGhlIGNoYW5n
ZSBkZXNjcmlwdGlvbj8KCiogV291bGQgeW91IGxpa2UgdG8gY29uc2lkZXIgdGhlIHRhZyDigJxG
aXhlc+KAnSBmb3IgdGhlIGNvbW1pdCBtZXNzYWdlPwoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC9jb21taXQvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYz9pZD0wODU3MjQ1MWI0
YjE3ODNmZGZmNzg3YjAxODhjNGQ1MGZkZjk2YjgxCgoK4oCmCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+IEBAIC0yODM0LDEyICsyODM0
LDE4IEBAICBzdGF0aWMgaW50IGFtZGdwdV9kbV9tb2RlX2NvbmZpZ19pbml0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQo+ICAJCQkJICAgICZkbV9hdG9taWNfc3RhdGVfZnVuY3MpOwo+Cj4g
IAlyID0gYW1kZ3B1X2Rpc3BsYXlfbW9kZXNldF9jcmVhdGVfcHJvcHMoYWRldik7Cj4gLQlpZiAo
cikKPiArCWlmIChyKSB7Cj4gKwkJZGNfcmVsZWFzZV9zdGF0ZShzdGF0ZS0+Y29udGV4dCk7Cj4g
KwkJa2ZyZWUoc3RhdGUpOwo+ICAJCXJldHVybiByOwo+ICsJfQo+Cj4gIAlyID0gYW1kZ3B1X2Rt
X2F1ZGlvX2luaXQoYWRldik7Cj4gLQlpZiAocikKPiArCWlmIChyKSB7Cj4gKwkJZGNfcmVsZWFz
ZV9zdGF0ZShzdGF0ZS0+Y29udGV4dCk7Cj4gKwkJa2ZyZWUoc3RhdGUpOwo+ICAJCXJldHVybiBy
Owo+ICsJfQo+Cj4gIAlyZXR1cm4gMDsKPiAgfQoKSSBpbWFnaW5lIHRoYXQgdGhlIGV4Y2VwdGlv
biBoYW5kbGluZyBjb2RlIGNhbiBiZSBpbXByb3ZlZCBhbm90aGVyIGJpdApmb3IgdGhpcyBmdW5j
dGlvbiBpbXBsZW1lbnRhdGlvbi4KSG93IGRvIHlvdSB0aGluayBhYm91dCB0byBhdm9pZCBzdWNo
IGR1cGxpY2F0ZSBzb3VyY2UgY29kZT8KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9j
ZXNzL2NvZGluZy1zdHlsZS5yc3Q/aWQ9MTViYzIwYzZhZjRjZWVlOTdhMWY5MGI0M2MwZTM4NjY0
M2MwNzFiNCNuNDc1CgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==

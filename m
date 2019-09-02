Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA033A50E3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 10:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0350C89B49;
	Mon,  2 Sep 2019 08:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1005489B49
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 08:07:56 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q19so4641685wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 01:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dcnwYP0l9ZZMKxGuHDXzwQdyhtArK//FoNqgnDXsr3M=;
 b=OAa1nOdleDdlNuGz/FG/qRtcXQoSJQ1brT9KjY9/hEMyRkEq7LeEY6yzGzq+kCfgk5
 DMTFNm8NiCu3AVerKlwCPpD0YoMhy9LvbNGMHwxcYvyHntm43R71gLu7AbJGcucXuFo0
 gkMORFC9KP9+grdVKcjH5+cAQB0CC8RBOBaCuxF24hHpnrmH/Cv3a8VOZXAhYmKqaGNL
 hTCMgmNRW9QxGpuVpWq654ST5rnDmYHgWC1VRUNTJRofeILJQPMVOLu9AipGKHgYtTHb
 DSsWHxSfn5ylHGRsPscxAPNPDOvkVC/pt4akJMT7TfkzFRmg5V96tqNYPRKInW6BeZfD
 Y4Bg==
X-Gm-Message-State: APjAAAWlb9SW+IYnqEvA3Pcw/U4Ulkxvn9IVicNALfoAZJBb8Q54z9wo
 fsygN+MaRFayEbIzgo7Qs/fSojbNWws=
X-Google-Smtp-Source: APXvYqzAvvUBONvEDmDvUqv1/+iLEqZrBYcDKiQqW1eeu+Gdc6DVbQnQZQGK+/MONug2WHiNQjE4Ow==
X-Received: by 2002:a1c:98c9:: with SMTP id a192mr18972277wme.29.1567411675221; 
 Mon, 02 Sep 2019 01:07:55 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a16sm5757322wmg.5.2019.09.02.01.07.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Sep 2019 01:07:54 -0700 (PDT)
Subject: Re: [PATCH 4/5] Revert "drm/edid: make drm_edid_to_eld() static"
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <a.hajda@samsung.com>
References: <AM0PR06MB40049562E295DD62302C8DB7ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
 <20190901161426.1606-1-jonas@kwiboo.se>
 <AM0PR06MB4004968EE64C136494040B7AACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 mQENBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAG0KE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT6JATsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIW5AQ0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAYkBHwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8guQINBFYnf6QBEADQ+wBYa+X2n/xIQz/RUoGHf84Jm+yTqRT43t7sO48/cBW9vAn9
 GNwnJ3HRJWKATW0ZXrCr40ES/JqM1fUTfiFDB3VMdWpEfwOAT1zXS+0rX8yljgsWR1UvqyEP
 3xN0M/40Zk+rdmZKaZS8VQaXbveaiWMEmY7sBV3QvgOzB7UF2It1HwoCon5Y+PvyE3CguhBd
 9iq5iEampkMIkbA3FFCpQFI5Ai3BywkLzbA3ZtnMXR8Qt9gFZtyXvFQrB+/6hDzEPnBGZOOx
 zkd/iIX59SxBuS38LMlhPPycbFNmtauOC0DNpXCv9ACgC9tFw3exER/xQgSpDVc4vrL2Cacr
 wmQp1k9E0W+9pk/l8S1jcHx03hgCxPtQLOIyEu9iIJb27TjcXNjiInd7Uea195NldIrndD+x
 58/yU3X70qVY+eWbqzpdlwF1KRm6uV0ZOQhEhbi0FfKKgsYFgBIBchGqSOBsCbL35f9hK/JC
 6LnGDtSHeJs+jd9/qJj4WqF3x8i0sncQ/gszSajdhnWrxraG3b7/9ldMLpKo/OoihfLaCxtv
 xYmtw8TGhlMaiOxjDrohmY1z7f3rf6njskoIXUO0nabun1nPAiV1dpjleg60s3OmVQeEpr3a
 K7gR1ljkemJzM9NUoRROPaT7nMlNYQL+IwuthJd6XQqwzp1jRTGG26J97wARAQABiQM+BBgB
 AgAJBQJWJ3+kAhsCAikJEBaat7Gkz/iuwV0gBBkBAgAGBQJWJ3+kAAoJEHfc29rIyEnRk6MQ
 AJDo0nxsadLpYB26FALZsWlN74rnFXth5dQVQ7SkipmyFWZhFL8fQ9OiIoxWhM6rSg9+C1w+
 n45eByMg2b8H3mmQmyWztdI95OxSREKwbaXVapCcZnv52JRjlc3DoiiHqTZML5x1Z7lQ1T3F
 8o9sKrbFO1WQw1+Nc91+MU0MGN0jtfZ0Tvn/ouEZrSXCE4K3oDGtj3AdC764yZVq6CPigCgs
 6Ex80k6QlzCdVP3RKsnPO2xQXXPgyJPJlpD8bHHHW7OLfoR9DaBNympfcbQJeekQrTvyoASw
 EOTPKE6CVWrcQIztUp0WFTdRGgMK0cZB3Xfe6sOp24PQTHAKGtjTHNP/THomkH24Fum9K3iM
 /4Wh4V2eqGEgpdeSp5K+LdaNyNgaqzMOtt4HYk86LYLSHfFXywdlbGrY9+TqiJ+ZVW4trmui
 NIJCOku8SYansq34QzYM0x3UFRwff+45zNBEVzctSnremg1mVgrzOfXU8rt+4N1b2MxorPF8
 619aCwVP7U16qNSBaqiAJr4e5SNEnoAq18+1Gp8QsFG0ARY8xp+qaKBByWES7lRi3QbqAKZf
 yOHS6gmYo9gBmuAhc65/VtHMJtxwjpUeN4Bcs9HUpDMDVHdfeRa73wM+wY5potfQ5zkSp0Jp
 bxnv/cRBH6+c43stTffprd//4Hgz+nJcCgZKtCYIAPkUxABC85ID2CidzbraErVACmRoizhT
 KR2OiqSLW2x4xdmSiFNcIWkWJB6Qdri0Fzs2dHe8etD1HYaht1ZhZ810s7QOL7JwypO8dscN
 KTEkyoTGn6cWj0CX+PeP4xp8AR8ot4d0BhtUY34UPzjE1/xyrQFAdnLd0PP4wXxdIUuRs0+n
 WLY9Aou/vC1LAdlaGsoTVzJ2gX4fkKQIWhX0WVk41BSFeDKQ3RQ2pnuzwedLO94Bf6X0G48O
 VsbXrP9BZ6snXyHfebPnno/te5XRqZTL9aJOytB/1iUna+1MAwBxGFPvqeEUUyT+gx1l3Acl
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c24fbace-3772-b50c-23da-5af35a6ac70f@baylibre.com>
Date: Mon, 2 Sep 2019 10:07:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AM0PR06MB4004968EE64C136494040B7AACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dcnwYP0l9ZZMKxGuHDXzwQdyhtArK//FoNqgnDXsr3M=;
 b=aIdG133MUwsuhfSLBa8fqn5EFclmRAPM0CnjV3oZTSa5E2c0Yz+hr27csv0yqo7TFL
 b8X8SF5d13aJ7QrpTS2UmJYT6C+0FFO0StQtRrMfnZd9koiMSzJ9eo2O5sbQaKTYNi3Z
 Z4okF48F8CMgldf7kxGmZLv8ityUqE4lfSXeClNkmIVCPeem7X1xL/NhJJAFsf5yjEjn
 12OPCmBOKyVuYV1cGfxNzeaJc/XXjDr23Ubu93wSJEGztEhwLOdUx/5KWLBgc9He4L2w
 esfvGuC9PX0wE9Eu6fjegI0J9F6ut3kokYjBbSHTepCTsCyWDol3zwhh9xvpaSAHA14Q
 pjWg==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEvMDkvMjAxOSAxODoxNCwgSm9uYXMgS2FybG1hbiB3cm90ZToKPiBkcm1fZWRpZF90b19l
bGQoKSBpcyBuZWVkZWQgdG8gdXBkYXRlIHN0YWxlIGNvbm5lY3RvciBFTEQgb24gSFBEIGV2ZW50
Lgo+IAo+IFRoaXMgcmV2ZXJ0cyBwYXJ0IG9mIGNvbW1pdCA3OTQzNmExYzliY2MgKCJkcm0vZWRp
ZDogbWFrZSBkcm1fZWRpZF90b19lbGQoKSBzdGF0aWMiKS4KCldoeSBub3QgYSBmdWxsIHJldmVy
dCA/CgpUaGUgZG9jdW1lbnRhdGlvbiByZXZlcnQgc2VlbXMgYWxzbyByZWxldmFudCBub3cKCk5l
aWwKCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDUgKysrLS0KPiAgaW5jbHVkZS9k
cm0vZHJtX2VkaWQuaCAgICAgfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiBpbmRleCA4MmE0Y2VlZDNmY2Yu
LjQ3YzQwOWFmMDkwMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gQEAgLTQwNjksNyArNDA2OSw3IEBA
IHN0YXRpYyB2b2lkIGNsZWFyX2VsZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+
ICAJY29ubmVjdG9yLT5hdWRpb19sYXRlbmN5WzFdID0gMDsKPiAgfQo+ICAKPiAtLyoKPiArLyoq
Cj4gICAqIGRybV9lZGlkX3RvX2VsZCAtIGJ1aWxkIEVMRCBmcm9tIEVESUQKPiAgICogQGNvbm5l
Y3RvcjogY29ubmVjdG9yIGNvcnJlc3BvbmRpbmcgdG8gdGhlIEhETUkvRFAgc2luawo+ICAgKiBA
ZWRpZDogRURJRCB0byBwYXJzZQo+IEBAIC00MDc3LDcgKzQwNzcsNyBAQCBzdGF0aWMgdm9pZCBj
bGVhcl9lbGQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiAgICogRmlsbCB0aGUg
RUxEIChFRElELUxpa2UgRGF0YSkgYnVmZmVyIGZvciBwYXNzaW5nIHRvIHRoZSBhdWRpbyBkcml2
ZXIuIFRoZQo+ICAgKiBIRENQIGFuZCBQb3J0X0lEIEVMRCBmaWVsZHMgYXJlIGxlZnQgZm9yIHRo
ZSBncmFwaGljcyBkcml2ZXIgdG8gZmlsbCBpbi4KPiAgICovCj4gLXN0YXRpYyB2b2lkIGRybV9l
ZGlkX3RvX2VsZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBzdHJ1Y3QgZWRpZCAq
ZWRpZCkKPiArdm9pZCBkcm1fZWRpZF90b19lbGQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3Rvciwgc3RydWN0IGVkaWQgKmVkaWQpCj4gIHsKPiAgCXVpbnQ4X3QgKmVsZCA9IGNvbm5lY3Rv
ci0+ZWxkOwo+ICAJdTggKmNlYTsKPiBAQCAtNDE2Miw2ICs0MTYyLDcgQEAgc3RhdGljIHZvaWQg
ZHJtX2VkaWRfdG9fZWxkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIHN0cnVjdCBl
ZGlkICplZGlkKQo+ICAJRFJNX0RFQlVHX0tNUygiRUxEIHNpemUgJWQsIFNBRCBjb3VudCAlZFxu
IiwKPiAgCQkgICAgICBkcm1fZWxkX3NpemUoZWxkKSwgdG90YWxfc2FkX2NvdW50KTsKPiAgfQo+
ICtFWFBPUlRfU1lNQk9MKGRybV9lZGlkX3RvX2VsZCk7Cj4gIAo+ICAvKioKPiAgICogZHJtX2Vk
aWRfdG9fc2FkIC0gZXh0cmFjdHMgU0FEcyBmcm9tIEVESUQKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vZHJtX2VkaWQuaCBiL2luY2x1ZGUvZHJtL2RybV9lZGlkLmgKPiBpbmRleCBiOTcxOTQx
OGMzZDIuLjQ5OTg3ODE4ZmUyMyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZWRpZC5o
Cj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2VkaWQuaAo+IEBAIC0zMzcsNiArMzM3LDcgQEAgc3Ry
dWN0IGRybV9jb25uZWN0b3I7Cj4gIHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlOwo+ICBzdHJ1
Y3QgZHJtX2Rpc3BsYXlfbW9kZTsKPiAgCj4gK3ZvaWQgZHJtX2VkaWRfdG9fZWxkKHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IsIHN0cnVjdCBlZGlkICplZGlkKTsKPiAgaW50IGRybV9l
ZGlkX3RvX3NhZChzdHJ1Y3QgZWRpZCAqZWRpZCwgc3RydWN0IGNlYV9zYWQgKipzYWRzKTsKPiAg
aW50IGRybV9lZGlkX3RvX3NwZWFrZXJfYWxsb2NhdGlvbihzdHJ1Y3QgZWRpZCAqZWRpZCwgdTgg
KipzYWRiKTsKPiAgaW50IGRybV9hdl9zeW5jX2RlbGF5KHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 050FF863EC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 16:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79076E83B;
	Thu,  8 Aug 2019 14:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BB06E83B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 14:09:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u25so2573612wmc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 07:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fRzbxgOaOYK4ZYdEjfC4xN07dECOTGDAf826r4TpQPs=;
 b=j5wGxC8gLfB97w20qrT4M/bAfxNy5Fdr0mrsqTevOZHTtWsQwpLJMKljQHMEwopYDw
 PPQGT3N8njG77jutCzQAQ1HyBuFGpCvGgb7HEjsA3BOiyZwCNgQitut+gmCR/KFBHC0u
 VUf69G5Yo4sXtGfDQWrwXLaLCfOmm0xcmlGfgeFB4DOzdWIhiU/Q3ZhRxL4HIPV8bfF2
 k6jZkpdmllZ3vpJb7LeXg9CwNmLM1NREy84Ep6zP2IHQcm35pepQ0U6YZWsy9mZgF2eN
 qruEaw+NfdKe2d5EoZWWnlzkpwmg1+06wLuHdXMtswLQ/TxNyhe10G7gNYUdv4yrpc0l
 ttwQ==
X-Gm-Message-State: APjAAAW/oxmX5Z+2Zop/mcgX8+Z7dRtZB9UXGRqQJMAoT61fau4Sc89H
 JP/LcUSUYY/KlEZ0lERTcMVD9RR4xnMZNw==
X-Google-Smtp-Source: APXvYqxp3PdDQPmSdAbC9WxolTZk3R/nQhJ96oYQMs3RR7dotLRNv9glMTIw4h4PFtic0dHZGEgDmw==
X-Received: by 2002:a1c:2c41:: with SMTP id s62mr4713556wms.8.1565273391975;
 Thu, 08 Aug 2019 07:09:51 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t14sm2906174wrv.12.2019.08.08.07.09.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 07:09:51 -0700 (PDT)
Subject: Re: [PATCH 4/9] drm: meson: vpp: use proper macros instead of magic
 constants
To: Kevin Hilman <khilman@baylibre.com>, 86zhm782g5.fsf@baylibre.com
References: <86zhm782g5.fsf@baylibre.com> <86tvcf82eu.fsf@baylibre.com>
 <7h36jyy3qn.fsf@baylibre.com>
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
Message-ID: <d4bb07f6-4b42-573b-abe2-5d54a8b99a92@baylibre.com>
Date: Thu, 8 Aug 2019 16:09:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7h36jyy3qn.fsf@baylibre.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fRzbxgOaOYK4ZYdEjfC4xN07dECOTGDAf826r4TpQPs=;
 b=SK8nH480nj/WrMqBsTFWCK4vvMh/mf+pzwiHCuJUPW1D3OlXb6m4XzFfa1GRe6PyBk
 cBnAYD8SeNv+3FWa8PqPhlhFFjrLS1AYWWgfbHaBvLiMqsQA6/V15d/mlTJ6z2tVzD64
 lgDgrFj78F4Mtfl6bhED/tDEutncBiVkHVyJ/3apd8UVMR2M1BmfWXmZxiabCN4cSXSP
 jUKpLhDRZfug6uCWm5quSKC7tFp3coH5EllSk5zpYU06H57PdFiJThyQllfe/FDnVDV7
 j5hUk4sFStNwapGnaAyL2Rp/MkrDzB9shyDQCm7h175qDusg6q2qnVUD8s/858NRmcmt
 B+0w==
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
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDYvMjAxOSAwMToxNSwgS2V2aW4gSGlsbWFuIHdyb3RlOgo+IEp1bGllbiBNYXNzb24g
PGptYXNzb25AYmF5bGlicmUuY29tPiB3cml0ZXM6Cj4gCj4+IFRoaXMgcGF0Y2ggYWRkIG5ldyBt
YWNyb3Mgd2hpY2ggYXJlIHVzZWQgdG8gc2V0IHRoZSBmb2xsb3dpbmcKPj4gcmVnaXN0ZXJzOgo+
PiAtIFZQUF9PU0RfU0NBTEVfQ09FRl9JRFgKPj4gLSBWUFBfRE9MQllfQ1RSTAo+PiAtIFZQUF9P
RklGT19TSVpFCj4+IC0gVlBQX0hPTERfTElORVMKPj4gLSBWUFBfU0NfTUlTQwo+PiAtIFZQUF9W
QURKX0NUUkwKPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE1hc3NvbiA8am1hc3NvbkBiYXls
aWJyZS5jb20+Cj4gCj4gWy4uLl0KPiAKPj4gQEAgLTk3LDIwICs5NywyMiBAQCB2b2lkIG1lc29u
X3ZwcF9pbml0KHN0cnVjdCBtZXNvbl9kcm0gKnByaXYpCj4+ICAJZWxzZSBpZiAobWVzb25fdnB1
X2lzX2NvbXBhdGlibGUocHJpdiwgImFtbG9naWMsbWVzb24tZ3htLXZwdSIpKSB7Cj4+ICAJCXdy
aXRlbF9iaXRzX3JlbGF4ZWQoMHhmZiA8PCAxNiwgMHhmZiA8PCAxNiwKPj4gIAkJCQkgICAgcHJp
di0+aW9fYmFzZSArIF9SRUcoVklVX01JU0NfQ1RSTDEpKTsKPj4gLQkJd3JpdGVsX3JlbGF4ZWQo
MHgyMDAwMCwgcHJpdi0+aW9fYmFzZSArIF9SRUcoVlBQX0RPTEJZX0NUUkwpKTsKPj4gLQkJd3Jp
dGVsX3JlbGF4ZWQoMHgxMDIwMDgwLAo+PiArCQl3cml0ZWxfcmVsYXhlZChWUFBfUFBTX0RVTU1Z
X0RBVEFfTU9ERSwKPj4gKwkJCSAgICAgICBwcml2LT5pb19iYXNlICsgX1JFRyhWUFBfRE9MQllf
Q1RSTCkpOwo+PiArCQl3cml0ZWxfcmVsYXhlZCgweDEwODA4MCwKPiAKPiBuaXQ6IHN0aWxsIGEg
bWFnaWMgY29uc3RhbnQgaGVyZSwgYW5kIGl0J3Mgbm90IG9idmlvdXMgd2h5IGl0J3MKPiBkaWZm
ZXJlbnQgZnJvbSB0aGUgY3VycmVudCBvbmUuCgpUaGlzIGlzIGEgbWFnaWMgY29uc3RhbnQsIGl0
J3MgYSBjb2xvciwgYnV0IGluZGVlZCBpdCBzaG91bGQgbm90IGNoYW5nZS4KCjB4MTAyMDA4MCBp
cyB0aGUgMTBiaXQgdmFyaWFudCBvZiAweDEwODA4MCwgb24gcHVycG9zZS4KCk5laWwKCj4gCj4g
S2V2aW4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

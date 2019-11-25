Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B49A108ADA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 10:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B445289FD9;
	Mon, 25 Nov 2019 09:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157A789FD9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 09:28:19 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t1so16990492wrv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 01:28:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tngVvt4b3pBCYn70he756tcP70oAMk3y1ZLBb92+vw8=;
 b=uSJBWhRFAa9xSX2M1vMARUaVclArwSnd5QM4MaAiobFw8b3z0S812Z8O8JSHjkyLh3
 +gnwqtYbXNtSKle1FXWujPBWYL8UkABL7owJeS5XCM6BMRf0mAohmqCQAaxiDo0T4xbE
 DXQC8svc7PL5y1ueAF1CC/x+9Mu14JRRu+e1kkwYyfZcT1jxBIpBVhZrcm62ZRhX++eQ
 KhpqtzJfuCw0euVC2w5ap+UD6GZgpb8fTZ3YyOB5MVtLBiUBkbiymM5UrUODBaZnF96p
 mMsFJAQWtFBdKVM0ovifhfs8whRtvPJ5LtnmgVlB+qL1Kvl02GFH3MGOZLyHKZKCY2uj
 4dsQ==
X-Gm-Message-State: APjAAAVJ3lKDmS1VHgKxcl/Q5QsrPnbONl8DsYI0W4vBflusWahg1ufy
 TG6HQsRkrj2R0W93GyP15k7xCTiO+RIi1A==
X-Google-Smtp-Source: APXvYqzXZ4GMoQMnIyOfiWSoE5HHFUf5pH7kq7/i8evY0q5YtZsoXf1+iW0GKMqcBcMxJ20rVybiWw==
X-Received: by 2002:adf:f4c9:: with SMTP id h9mr30179550wrp.354.1574674097269; 
 Mon, 25 Nov 2019 01:28:17 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h124sm7885198wme.30.2019.11.25.01.28.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Nov 2019 01:28:16 -0800 (PST)
Subject: Re: [PATCH v3] drm/bridge/synopsys: dsi: driver-specific
 configuration of phy timings
To: Heiko Stuebner <heiko@sntech.de>
References: <20191123103904.22843-1-heiko@sntech.de>
 <45168bb1-ca49-3a88-12d6-f398bebac27f@baylibre.com> <5060226.21S8zkcLb9@phil>
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
Message-ID: <b8c43767-d065-d6da-a588-9a05e8aa4f1e@baylibre.com>
Date: Mon, 25 Nov 2019 10:28:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5060226.21S8zkcLb9@phil>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tngVvt4b3pBCYn70he756tcP70oAMk3y1ZLBb92+vw8=;
 b=HBK4fwPfJhU5EtIXxYjZ7UGZ67EO02iF7XfqBV6P7ANhxLshlcSaMPfTRkFWfDvQnM
 0eHI4JItitkgFqJ0dXS+N6JMr+Ttr8Jv2OHXWiLRDJh8pknsJ1uVDDVLibAx11t+WJIO
 kMAnjqeC/4gikbWewBV9NDC7h4zdLwgSKPhECxR+M6YWqtZYJs+AnjMUq317+jynKz2M
 tfCzBasLAZfAad7zLKdnsCUBJ+UMu2Kim3NU+ZlBQ3mLAjsJgPPRiFoSJ6je9gwf/j7R
 kpqBCYsLRF3B9bEcYDO85OF+e10sPGcdvn45yhsX3+Cnchkn8wfe2MsMBK5XEdD63JCU
 IyJA==
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
Cc: bivvy.bi@rock-chips.com, jernej.skrabec@siol.net, xzy.xu@rock-chips.com,
 kuninori.morimoto.gx@renesas.com, jonas@kwiboo.se, sean@poorly.run,
 briannorris@chromium.org, dianders@chromium.org,
 DRI Development <dri-devel@lists.freedesktop.org>, philippe.cornu@st.com,
 yannick.fertre@st.com, nickey.yang@rock-chips.com, eddie.cai@rock-chips.com,
 Laurent.pinchart@ideasonboard.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyMy8xMS8yMDE5IDIxOjUxLCBIZWlrbyBTdHVlYm5lciB3cm90ZToKPiBIaSBOZWls
LAo+IAo+IEFtIFNhbXN0YWcsIDIzLiBOb3ZlbWJlciAyMDE5LCAxMzozODo0MSBDRVQgc2Nocmll
YiBOZWlsIEFybXN0cm9uZzoKPj4gTGUgMjMvMTEvMjAxOSDDoCAxMTozOSwgSGVpa28gU3R1ZWJu
ZXIgYSDDqWNyaXQgOgo+Pj4gRnJvbTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHRo
ZW9icm9tYS1zeXN0ZW1zLmNvbT4KPj4+Cj4+PiBUaGUgdGltaW5nIHZhbHVlcyBmb3IgZHctZHNp
IGFyZSBvZnRlbiBkZXBlbmRlbnQgb24gdGhlIHVzZWQgZGlzcGxheSBhbmQKPj4+IGFjY29yZGlu
ZyB0byBQaGlsaXBwZSBDb3JudSB3aWxsIG1vc3QgbGlrZWx5IGFsc28gZGVwZW5kIG9uIHRoZSB1
c2VkIHBoeQo+Pj4gdGVjaG5vbG9neSBpbiB0aGUgc29jLXNwZWNpZmljIGltcGxlbWVudGF0aW9u
Lgo+Pj4KPj4+IFRvIHNvbHZlIHRoaXMgYW5kIGFsbG93IHNwZWNpZmljIGltcGxlbWVudGF0aW9u
cyB0byBkZWZpbmUgdGhlbSBhcyBuZWVkZWQKPj4+IGFkZCBhIG5ldyBnZXRfdGltaW5nIGNhbGxi
YWNrIHRvIHBoeV9vcHMgYW5kIGNhbGwgdGhpcyBmcm9tIHRoZSBkcGh5X3RpbWluZwo+Pj4gZnVu
Y3Rpb24gdG8gcmV0cmlldmUgdGhlIG5lY2Vzc2FyeSB2YWx1ZXMgZm9yIHRoZSBzcGVjaWZpYyBt
b2RlLgo+Pj4KPj4+IFJpZ2h0IG5vdyB0aGlzIGhhbmRsZXMgdGhlIGhzMmxwICsgbHAyaHMgd2hl
cmUgUm9ja2NoaXAgU29DcyBuZWVkIGhhbmRsaW5nCj4+PiBhY2NvcmRpbmcgdG8gdGhlIHBoeSBz
cGVlZCwgd2hpbGUgU1RNIHNlZW1zIHRvIGJlIG9rIHdpdGggc3RhdGljIHZhbHVlcy4KPj4+Cj4+
PiBjaGFuZ2VzIGluIHYzOgo+Pj4gLSBjaGVjayBleGlzdGVuY2Ugb2YgcGh5X29wcy0+Z2V0X3Rp
bWluZyBpbiBfX2R3X21pcGlfZHNpX3Byb2JlKCkKPj4+IC0gZW1pdCBhY3R1YWwgZXJyb3Igd2hl
biBnZXRfdGltaW5nKCkgY2FsbCBmYWlscwo+Pj4gLSBhZGQgdGFncyBmcm9tIFBoaWxpcHBlIGFu
ZCBZYW5uaWNrCj4+Pgo+Pj4gY2hhbmdlcyBpbiB2MjoKPj4+IC0gYWRkIGRyaXZlci1zcGVjaWZp
YyBoYW5kbGluZywgZG9uJ3QgZm9yY2UgYWxsIGJyaWRnZSB1c2VycyB0byB1c2UKPj4+ICAgdGhl
IHNhbWUgdGltaW5ncywgYXMgc3VnZ2VzdGVkIGJ5IFBoaWxpcHBlCj4+Pgo+Pj4gU3VnZ2VzdGVk
LWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgo+Pj4gU2lnbmVkLW9m
Zi1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHRoZW9icm9tYS1zeXN0ZW1zLmNv
bT4KPj4+IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29t
Pgo+Pj4gVGVzdGVkLWJ5OiBZYW5uaWNrIEZlcnRyZSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgoK
CllvdSBmb3Jnb3QgdG8gQ2MgZHJpLWRldmVsLCBzbyBJIGNhbid0IGFwcGx5IGl0LgoKQ291bGQg
eW91IHJlc2VudCBpdCA/CgpOZWlsCgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jIHwgMjcgKysrKystLQo+Pj4gIGRyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9LY29uZmlnICAgICAgICAgICAgICB8ICAxICsKPj4+ICAuLi4vZ3B1L2RybS9y
b2NrY2hpcC9kdy1taXBpLWRzaS1yb2NrY2hpcC5jICAgfCA3OCArKysrKysrKysrKysrKysrKysr
Cj4+PiAgZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYyAgICAgICAgIHwgMTMg
KysrKwo+Pj4gIGluY2x1ZGUvZHJtL2JyaWRnZS9kd19taXBpX2RzaS5oICAgICAgICAgICAgICB8
ICA5ICsrKwo+Pj4gIDUgZmlsZXMgY2hhbmdlZCwgMTIxIGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCj4+Pgo+PiBbLi4uXQo+Pgo+Pgo+PiBMb29rcyBnb29kLAo+PiBSZXZpZXdlZC1ieTog
TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+Pgo+PiBJIGNhbiBhcHBs
eSBpdCBvbiBtb25kYXkgaWYgeW91IHdhbnQuCj4gCj4gdGhhdCB3b3VsZCBiZSB2ZXJ5IGNvb2wu
IExvb2tpbmcgZm9yd2FyZCB0byBtb25kYXkgdGhlbgo+IAo+IFRoYW5rcwo+IEhlaWtvCj4gCj4g
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849377C6AA
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 17:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAD489F3C;
	Wed, 31 Jul 2019 15:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA8889B48
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 15:32:36 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id l2so60213805wmg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 08:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=f/hNdz0qX9ihYQK8skLrxEItTeCBiCN+CMcmJWDZmZ8=;
 b=ZJ3ld7Cbxdqxoe5zcUCxQ9q6GkPxCySroKrTj4+Zm4SCcyzRYd3GNDH6fIPYaas/5l
 oAqyBolakL/64YCLw9aNQEnwpUi/nRgqZK2yVHsASzE1c+gJMl3JGteD9J1NEV54Px0V
 PhA8c1smzX2XlWwseWVIIOcw21WFBkL5xDSxv954T+Q8cjwiUr6vq9ayM9w8IBGiselt
 8epR0hUVDOx9vb8d5yvcLUcsuls03IlkyCWL7+RfnA+ETX9DP+KfLOrr8ZCHkS+9141F
 nfWPPm0KE9pemvkbyWNPjyqShAjLLgZrqdBRbjdHDRI/IJAI8BqkrdWRqXqmnkHhq924
 HNGA==
X-Gm-Message-State: APjAAAWJaRIWAChhxzVYq+gUlcsqXHRt9HEiZTlRYdjPdbHtsU3HqfV9
 3VltHp2iblQBygBasj3E/rwOcA==
X-Google-Smtp-Source: APXvYqxaviW4fEOrpmx/4Evy7yl+eOLL4PdevLrhHZKw3/QB5/lABaiB1v26yFpmsB6ArUS1wMPchg==
X-Received: by 2002:a7b:ce8a:: with SMTP id
 q10mr105816482wmj.109.1564587154590; 
 Wed, 31 Jul 2019 08:32:34 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r123sm61555981wme.7.2019.07.31.08.32.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 08:32:33 -0700 (PDT)
Subject: Re: Review required [Was: Associate ddc adapters with connectors]
From: Neil Armstrong <narmstrong@baylibre.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <20190726183520.GA22572@ravnborg.org> <20190726185538.GD14981@ravnborg.org>
 <6560f93c-a48f-2a8c-afeb-d5e8e200480d@baylibre.com>
 <20190731104007.GA23138@ravnborg.org>
 <959cf323-c6b9-895b-592c-81c52aacae6e@collabora.com>
 <ce68a0df-1719-7b53-b0ed-89caa9afc4a0@baylibre.com>
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
Message-ID: <65481afa-1104-4ee9-e53d-f2732a10d4b9@baylibre.com>
Date: Wed, 31 Jul 2019 17:32:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ce68a0df-1719-7b53-b0ed-89caa9afc4a0@baylibre.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=f/hNdz0qX9ihYQK8skLrxEItTeCBiCN+CMcmJWDZmZ8=;
 b=aF22qCf2+80nfULt45GEqs6RMQa7hWf/lxvZC8YZQyD1qUazIqf48Mb4Da7QzAaQCI
 Wts4VUoSHfVqp9yjTdbtGMLJavglnjyumhxEsIhFyAtts0kGh/6m9YtXjs/lryMsQFfH
 8QSzz5KwKVOuFd8FSIY0R417Lvq5kDRr1QAVO+NYoKExLx9wXxqdRcJmovRjfPY2fW96
 9R3LstiXLKMtZ60NZKY4Sy+JPNtZ6GpKp5BqLseM76Q4vDfdW4bdDWIL9kpVaBDMtbIX
 ze5jBIrokDIh7PqkyKmSrRg5ZYC/H2bsZoKA2DQj57NLAiybqDpzIHHBNBIxmvqEHRQp
 j0MA==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, Vincent Abriou <vincent.abriou@st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Dave Airlie <airlied@redhat.com>, freedreno@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplaiwKCk9uIDMxLzA3LzIwMTkgMTY6MjIsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+
IE9uIDMxLzA3LzIwMTkgMTU6MTAsIEFuZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPj4gVyBk
bml1IDMxLjA3LjIwMTkgb8KgMTI6NDAsIFNhbSBSYXZuYm9yZyBwaXN6ZToKPj4+IEhpIE5laWwu
Cj4+Pgo+Pj4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTA6MDA6MTRBTSArMDIwMCwgTmVpbCBB
cm1zdHJvbmcgd3JvdGU6Cj4+Pj4gSGkgU2FtLAo+Pj4+Cj4+Pj4gT24gMjYvMDcvMjAxOSAyMDo1
NSwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+Pj4+PiBIaSBhbGwuCj4+Pj4+Cj4+Pj4+IEFuZHJ6ZWog
aGF2ZSBkb25lIGEgZ29vZCBqb2IgZm9sbG93aW5nIHVwIG9uIGZlZWRiYWNrIGFuZCB0aGlzIHNl
cmllcyBpcwo+Pj4+PiBub3cgcmVhZHkuCj4+Pj4+Cj4+Pj4+IFdlIG5lZWQgYWNrIG9uIHRoZSBw
YXRjaGVzIHRvdWNoaW5nIHRoZSBpbmRpdmlkdWFsIGRyaXZlcnMgYmVmb3JlIHdlIGNhbgo+Pj4+
PiBwcm9jZWVkLgo+Pj4+PiBQbGVhc2UgY2hlY2sgeW91ciBkcml2ZXJzIGFuZCBnZXQgYmFjay4K
Pj4+Pgo+Pj4+IEkgY2FuIGFwcGx5IGFsbCBjb3JlIGFuZCBtYWludGFpbmVyLWFja2VkIHBhdGNo
ZXMgZm9yIG5vdyA6Cj4+Pj4gMSwgMiwgNywgMTAsIDExLCAxNiwgMTcsIDE4LCAxOSwgMjAsIDIx
LCAyMiwgMjMKPj4+Pgo+Pj4+IGFuZCBBbmRyemVqIGNhbiByZXNlbmQgbm90IGFwcGxpZWQgcGF0
Y2hlcyB3aXRoIFlvdXJzIGFuZCBFbWlsJ3MgUmV2aWV3ZWQtYnksCj4+Pj4gc28gd2UgY2FuIHdh
aXQgYSBmZXcgbW9yZSBkYXlzIHRvIGFwcGx5IHRoZW0uCj4+Pgo+Pj4gU291bmRzIGxpa2UgYSBn
b29kIHBsYW4uCj4+PiBUaGFua3MgZm9yIHRoYWtpbmcgY2FyZSBvZiB0aGlzLgo+Pgo+PiBXaGVu
IGlzIGl0IGdvb2QgdGltZSB0byByZXNlbmQgcGF0Y2hlcyAzLCA0LCA1LCA2LCA4LCA5LCAxMiwg
MTMsIDE0LCAxNSwgMjQgYXMgYQo+PiBuZXcgc2VyaWVzPwo+IAo+IEknbGwgcGluZyB5b3Ugd2hl
biBldmVyeXRoaW5nIGlzIGFwcGxpZWQsIGJ1aWxkLXRlc3RlZCBhbmQgcHVzaGVkIG9uIGRybS1t
aXNjLW5leHQKCkkgcHVzaGVkIDEsIDIsIDcsIDEwLCAxMSwgMTYsIDE3LCAxOCwgMTksIDIwLCAy
MSwgMjIsIDIzIDoKYmVkN2EyMTgyZGU2IGRybS9yYWRlb246IFByb3ZpZGUgZGRjIHN5bWxpbmsg
aW4gY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQo1YjUwZmEyYjM1YTQgZHJtL2FtZGdwdTogUHJv
dmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5CmNmYjQ0NDU1Mjky
NiBkcm0vYnJpZGdlOiB0aS10ZnA0MTA6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9y
IHN5c2ZzIGRpcmVjdG9yeQo5ZWJjNGQyMTQwYWQgZHJtL2JyaWRnZTogZHctaGRtaTogUHJvdmlk
ZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5CmE0ZjkwODdlODVkZSBk
cm0vYnJpZGdlOiBkdW1iLXZnYS1kYWM6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9y
IHN5c2ZzIGRpcmVjdG9yeQozNTBmZDU1NGVlNDQgZHJtL2FzdDogUHJvdmlkZSBkZGMgc3ltbGlu
ayBpbiBjb25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5Cjk1NzJhZTE3NmExMCBkcm0vbWdhZzIwMDog
UHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5CjcwNThlNzY2
ODJkNyBkcm06IHN0aTogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBoZG1pIGNvbm5lY3RvciBzeXNm
cyBkaXJlY3RvcnkKMmFlN2ViMzcyZWQ0IGRybS9pbXg6IGlteC10dmU6IFByb3ZpZGUgZGRjIHN5
bWxpbmsgaW4gY29ubmVjdG9yJ3Mgc3lzZnMKYmUwZWMzNTk0MGJjIGRybS9pbXg6IGlteC1sZGI6
IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yJ3Mgc3lzZnMKMWU4ZjE3ODU1ZmY4IGRy
bS9zdW40aTogaGRtaTogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBzdW40aSBoZG1pIGNvbm5lY3Rv
ciBzeXNmcyBkaXJlY3RvcnkKMTAwMTYzZGY0MjAzIGRybTogQWRkIGRybV9jb25uZWN0b3JfaW5p
dCgpIHZhcmlhbnQgd2l0aCBkZGMKZTFhMjljNmM1OTU1IGRybTogQWRkIGRkYyBsaW5rIGluIHN5
c2ZzIGNyZWF0ZWQgYnkgZHJtX2Nvbm5lY3RvcgoKTmVpbAoKPiAKPiBOZWlsCj4gCj4+Cj4+IEFu
ZHJ6ZWoKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

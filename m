Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA12B40086
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB2910E6A9;
	Tue,  2 Sep 2025 12:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TVy5TnMy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7136510E6A9
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 12:29:36 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3dad6252eacso241290f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 05:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756816175; x=1757420975; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=1ZrMGz19D43nUqFgTyxFJMNWsEoiEGhGU7kOoh8E0aU=;
 b=TVy5TnMyWHUZZxk396jJXgDChtjZWFhmAhRlUXhXPc4y+UCuKhumhGI5WB3yEHQ/mC
 ddIeqBvpZpkQ3wD7+kDWcGz1UU+VRwcRf+9lZp7l8EQkos84t7SJ9eYxeNhtSmoWqWJk
 U9hs+g5UDQSy2vjvkSM1d853Ma5QR+1t/tWb9TFvoG7VXU1/w1A2HF2amN/oCJKztXXX
 XdgoIqbQuyW8ZA/rmWgUXSIPx2EIpMXelcUsKtdkf1rEc+P4DxZ6Hwl8ro884JwkZOX3
 nuK3e8HFTnAQKov9uRRM72kSUPwq5HDn4jfoPIuiwlL2gwsni0KFRxurZzbWyAifsItN
 GlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756816175; x=1757420975;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1ZrMGz19D43nUqFgTyxFJMNWsEoiEGhGU7kOoh8E0aU=;
 b=RYOpLaS599zD1aJpOvDBleKoNvjWPBEFltcTAEGQCEjwxwLuCnFq1oehS5A0szfdxq
 SAt5iutBU/v2nRKRS2DpLrnIrP09Ro8Bf0HyUNPCPLdBn4UlN2jxEXUV4QPDnwY1NgjI
 dd947i/tfFre0zEp5c9WIq4DX04WMsSRdKiTkXu5eTgJABlFt7xvIe1L342Wm1p2nJn9
 PQJIRu7/NKoPfMo2YC0xQSBYKApVY9pfhHcjCi6O4Ue2y3KbTWmv3896dW/dL9bY7d7x
 Z3aVIKUK+CvCBnBYr8o0XTnzusJvuiq4cuoJqfEdH48JveeOgRGXPy0Md43SE32IXmn9
 j7vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMxKyGXnNlEf3gN6MOmfo1M8NConmkNScFDO78/OjROXzz/AXZ3DbvorBjk9uM5iXUO70/snbUD38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmaRwNDt8/vop5NSTMFENJWCZLrne/oRCziYvinlJLQMEEHgEi
 hxnrBD2e/4eP1ruQUz7V2V4G0lCbOvo0/TG2Y7DkA86C2wqjfYMxFTxrPM7xie5P6Wo=
X-Gm-Gg: ASbGncsaSMdu7hp3CG0Z+pyTCn/loS24m/1TOjzDHUEMPujkXzkYbDlTREop0+Y/NoW
 Ik1nGKbSkgRczzvyc9I8qDbfGBOuTHdh+ND/Mp/ExrA/9T9DWN+3l1WXhux15UhWyoWA1IOg2vj
 Wq4eVcdzkIfXwkSR9fJFPDLlizyWSAe3qLfbEmrQZICLClyKKcnwocyUFyTr3JgFCkja5wuTPah
 h3e6CrvUn/kwgZf7GNaldMCcd7EigPPWWH0ot+gcpChoI4FT/ZdZ4wKj9Rmo5PtN8S5e4ddhS4a
 w06u0a/xKfwNdy+iDmq6tMmbyrUFizYt0MYcE3rpqZVZUVPsdsX1QIuCvdETtyoSCJtygcKAxBJ
 aByRxLcw7ef6qiExVerrkvutZKOZH/inkT/Ol0sJiRrBPCtz45OGoPKJrcmjvwLKvX1GTkeVADp
 0=
X-Google-Smtp-Source: AGHT+IE1b3znR8mhSVfN1o59ljoC/UoU3/SWyuUcMM/rQ1Xo7sYc7jTiyhzTL42RejqME3JwAEmmLg==
X-Received: by 2002:a5d:64c6:0:b0:3ce:f0a5:d586 with SMTP id
 ffacd0b85a97d-3d1dc5a2fe0mr7157423f8f.1.1756816174847; 
 Tue, 02 Sep 2025 05:29:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939?
 ([2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf33adf170sm21033678f8f.33.2025.09.02.05.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 05:29:34 -0700 (PDT)
Message-ID: <81b1e0b8-6a5b-4eb9-8f9d-fe9a52f0afcd@linaro.org>
Date: Tue, 2 Sep 2025 14:29:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document static lanes mapping
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
 <20250902-topic-x1e80100-hdmi-v2-3-f4ccf0ef79ab@linaro.org>
 <slgu2d4iv6ef76f43gvwaelcl5ymymsvhokyunalq7z3l2ht3j@t7pko4rtqvgm>
 <bf772209-2420-4794-a52a-1d5932146307@linaro.org>
 <tl4fskw6yq6rniwwqkrvnulfpgym3jswlt5bmulgquogv7xkct@6bl4boesilsw>
 <14f334fc-35de-4f21-8eb1-f6b41ac24704@linaro.org>
 <oel3t35pxegxaowcfjbrzrxvuw47p7pzcinz7kf2uj2ivcderv@efbttlqpwcc7>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <oel3t35pxegxaowcfjbrzrxvuw47p7pzcinz7kf2uj2ivcderv@efbttlqpwcc7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/09/2025 14:22, Dmitry Baryshkov wrote:
> On Tue, Sep 02, 2025 at 12:05:45PM +0200, Neil Armstrong wrote:
>> On 02/09/2025 11:46, Dmitry Baryshkov wrote:

<snip>

>>
>> This is wrong, those are the internal connections to the controllers,
>> those are fixed. I'm speaking about the external lanes, but there's only
>> a single port.
>>
>> So, following your suggestion, we should use the Output port 0, but as it's
>> only a single port it would need to have 2 endpoints, one for USB3 and one for
>> DP.
>>
>> For example:
>>
>> \{
>> 	dp-connector {
>> 		compatible = "dp-connector";
>> 		type = "a";
>>
>> 		port {
>> 			dp_con: endpoint {
>> 				remote-endpoint = <&usb_1_ss2_qmpphy_dp_out>;
>> 			};
>> 		};
>> 	};
>>
>> 	usb-a-connector {
>> 		compatible = "usb-a-connector";
>>
>> 		ports {
>> 			#address-cells = <1>;
>> 			#size-cells = <0>;
>>
>> 			port@0 {
>> 				reg = <0>;
>>                       		usb_con_hs: endpoint {
>>                          		remote-endpoint = <&usb_1_ss2_dwc3_hs>;
>>                       		};
>>                   	};
>>
>>                   	port@1 {
>>                       		reg = <1>;
>>                      		usb_con_ss: endpoint {
>>                           		remote-endpoint = <&usb_1_ss2_qmpphy_usb3_out>;
>>                       		};
>>                   	};
>> 		};
>> 	};
>>
>> };
>>
>> &usb_1_ss2_dwc3_hs {
>> 	remote-endpoint = <&usb_1_ss2_dwc3_hs>;
>> };
>>
>> &usb_1_ss2_qmpphy {
>> 	/delete-property/ mode-switch;
>> 	/delete-property/ orientation-switch;
>>
>> 	ports {
>> 		
>> 		port@0{
>> 			#address-cells = <1>;
>> 			#size-cells = <0>;
>>
>> 			/delete-node/ endpoint;
>>
>> 			usb_1_ss2_qmpphy_usb3_out: endpoint@0 {
>> 				reg = <0>;
>> 				
>> 				remote-endpoint = <&usb_con_ss>;
>>
>> 				data-lanes = <1 2 0 0>;
>> 			};
>>
>> 			usb_1_ss2_qmpphy_dp_out: endpoint@1 {
>> 				reg = <1>;
>> 				
>> 				remote-endpoint = <&dp_con>;
>>
>> 				data-lanes = <0 0 1 2>;
>> 			};
>> 		};
>> 	};
>> };
>>
>> So the driver logic would need to look at the port0/endpoint0 and port0/endpoint1
>> data-lanes to figure out the mode.
>>
>> Is this what you were thinking ?
> 
> No, I was really thinking about the data-lanes in the PHY parts, so I
> was incorrect there (which is incrrect as you've pointed out).
> 
> The endpoints approach looks interesting though.
> 

Indeed this would accurately describe the data flow and lane mapping, but
I fear this would add a very complex logic in the driver.

Anyway I'll try to drop something.

Neil

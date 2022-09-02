Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1DF5AA8E0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 09:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B402B10E794;
	Fri,  2 Sep 2022 07:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33F010E794
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 07:41:09 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso4775194pjk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Sep 2022 00:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=IIHLILzbGuXqgslQN1WBmkWnSeVpr2v3v0TFiIJe0xw=;
 b=SggwfFnkk4WnKTCkjRo8wxOLOkLkjR+w0QUOyDgmUCKwOHE7zVcit3qmwyPQbJP9ag
 A5b0yOKHNkRXT298ezzCuqR1ujEqkP3G9H1GlZl3qBZZYYcf4xPu7G/mePeVycsuVySX
 U0bcxCMH+Af01i4glp4VIIYyWntuJ334VokLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IIHLILzbGuXqgslQN1WBmkWnSeVpr2v3v0TFiIJe0xw=;
 b=7THGVbV4hEr1UvSTInulAZa0zN+hKWSHasbIxuS5SKBc8YKaBMWIYyaLIBXmsSybf5
 qz7wSjZxYVqjaytfVU4ruhRfAesyBsp8HtFG5Ri1OBvWOCAAKKxU9sttDSd6QjYIAJ/m
 7lFGhGnFTUpZU0rju3JXpbc9seDHIITbJHBxR7AM+lYDIOrN5bMBDjPz64LFqkTwDGzX
 GHb2Xkzvg1sL4MAn/LCAieU6LWkUQFJghE9TzSY+s139BUzJfU9lI5974+9MT8OgmEy3
 PnqgmmcVG1CPbn1OLROILh4Nw2XglMYrDfan9/p1hVmL423+9fXhC4fKgTYUpWWtdbAq
 8Z+Q==
X-Gm-Message-State: ACgBeo0mDDlI3ll//tcP/W52FdSHcB/+ob0A3tLRl3spcCFbZwo1AKKB
 C+4jWa2DY5+2YvQZitlBnDiftw==
X-Google-Smtp-Source: AA6agR7xgggrWl+4LoWGbztJNZ3O0koP9zDkQXdW2ZwFvljRxdX+IX5VNWo17R4v2gv+Yq5BMIEQcA==
X-Received: by 2002:a17:90a:ce12:b0:1fb:b6d5:8c4e with SMTP id
 f18-20020a17090ace1200b001fbb6d58c4emr3514712pju.244.1662104469118; 
 Fri, 02 Sep 2022 00:41:09 -0700 (PDT)
Received: from chromium.org (137.22.168.34.bc.googleusercontent.com.
 [34.168.22.137]) by smtp.gmail.com with ESMTPSA id
 w19-20020a170902ca1300b0016efbccf2c0sm869573pld.56.2022.09.02.00.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 00:41:08 -0700 (PDT)
Date: Fri, 2 Sep 2022 07:41:07 +0000
From: Prashant Malani <pmalani@chromium.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/9] dt-bindings: usb: Add Type-C switch binding
Message-ID: <YxGzk6DNAt0aCvIY@chromium.org>
References: <CACeCKackdbDZrk5fk7qyMwSdTdzyTS=m1vHPFnQOj672W=2nOA@mail.gmail.com>
 <20220628182336.GA711518-robh@kernel.org>
 <CAEXTbpex9nxP-nyPWvSBchAW4j3C4MZfVHTb=5X0iSLY1bSAKg@mail.gmail.com>
 <CAEXTbpf_jxK-R5aA81FCbpAH4bChA2B9+8qExZUbA7Y+Ort=Gg@mail.gmail.com>
 <CAL_Jsq+C04RXLtm6Ac85Ru3EGwJbqV_UD3_dDWVrKvFSvdm7Ng@mail.gmail.com>
 <CAE-0n53ers881LOTCEmKDDxJQt+5vvXJSURs=o6TcOiR5m_EAw@mail.gmail.com>
 <CACeCKacJnnk4_dXEX7XiboOWrYpfAcE=ukP63agVAYUxWR9Vbg@mail.gmail.com>
 <CAE-0n50jm1ovUcBC0GCQJszk-4u+0vDQtAxHxsu9SLyn_CkQuQ@mail.gmail.com>
 <CACeCKadtmGZ5iuTHdMms6ZHGn-Uv=MbcdtqmUzqCb=5WHuPj2Q@mail.gmail.com>
 <20220712174551.GG1823936-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220712174551.GG1823936-robh@kernel.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Jul 12 11:45, Rob Herring wrote:
> 
> That's not the right interpretation. There should not be some Type-C 
> specific child mux/switch node because the device has no such h/w within 
> it. Assuming all the possibilities Stephen outlined are valid, it's 
> clear this lane selection has nothing to do with Type-C. It does have an 
> output port for its DP output already and using that to describe the 
> connection to DP connector(s) and/or Type-C connector(s) should be 
> handled.
> Rob

Below I've listed the proposal binding (for the Type-C connector) along
with 2 sample hardware diagrams and corresponding DT.

The updated binding in usb-c-connector would be as follows:

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index ae515651fc6b..a043b09cb8ec 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -183,6 +183,30 @@ properties:
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: Super Speed (SS), present in SS capable connectors.
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          "^endpoint@[0-1]$":
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            description:
+              Endpoints for the two SS lanes. endpoint@0 refers to SSTRX1 (A2,A3,B10,B11)
+              and endpoint@1 refers to SSTRX2 (B2,B3,A10,A11).
+            additionalProperties: false
+
+              properties:
+                reg:
+                  maxItems: 1
+
+                remote-endpoint: true
+
+              required:
+                - reg
+                - remote-endpoint

       port@2:
         $ref: /schemas/graph.yaml#/properties/port

Here are 2 examples of how that would look on some existing hardware:

Example 1. 2 usb-c-connectors connecting to 1 drm bridge / DP switch:

Here is the diagram we are using on the MTK platform:

                 SOC
        +---------------------+                                              C0
        |                     |            +----------+       2 lane      +--------+
        |                     |            |          +---------/---------+ SSTRX1 |
        |                     |            |          |                   |        |
        |    MIPI DPI         |            |          |  2 lane           |        |
        |                     +------------+ ANX 7625 +---/-----+    +----+ SSTRX2 |
        |                     |            |          |         |    |    +--------+
        |                     |            +----------+         |    |
        +---------------------+                                 |    |
        |                     |            +----------+ 2 lane  |    |       C1
        |                     |            |          +----/----C----+    +--------+
        |    USB3 HC          |   2 lane   |          |         |         | SSTRX1 |
        |                     +-----/------+ USB3 HUB |         +---------+        |
        |  (host controller)  |            |          |       2 lane      |        |
        |                     |            |          +---------/---------+ SSTRX2 |
        +---------------------+            |          |                   |        |
                                           +----------+                   +--------+

Some platforms use it6505, so that can be swapped in for anx7625
without any change to the rest of the hardware diagram.

From the above, we can see that it is helpful to describe the
Type-C SS lines as 2 endpoints:
- 1 for SSTX1+SSRX1 (A2,A3 + B10,B11)
- 1 for SSTX2+SSRX2 (B2,B3 + A10, A11)

A device tree for this would look as follows:

// Type-C port driver
ec {
    ...
    cros_ec_typec {
        ...
        usb-c0 {
            compatible = "usb-c-connector";
            ports {
                hs : port@0 {
                    ...
                };
                ss: port@1 {
                    reg = <1>;
                    c0_sstrx1: endpoint@0 {
                        reg = <0>;
                        remote-endpoint = <&anx7625_out0>;
                    };
                    c0_sstrx2: endpoint@0 {
                        reg = <0>;
                        remote-endpoint = <&usb3hub_out0>;
                    };
                };
                sbu : port@2 {
                    ...
                };
            };
        };
        usb-c1 {
            compatible = "usb-c-connector";
            ports {
                hs : port@0 {
                    ...
                };
                ss: port@1 {
                    reg = <1>;
                    c1_sstrx1: endpoint@0 {
                        reg = <0>;
                        remote-endpoint = <&anx7625_out1>;
                    };
                    c1_sstrx2: endpoint@0 {
                        reg = <0>;
                        remote-endpoint = <&usb3hub_out1>;
                    };
                };
                sbu : port@2 {
                    ...
                };
            };
        };
    };
};

// DRM bridge / Type-C mode switch
anx_bridge: anx7625@58 {
    compatible = "analogix,anx7625";
    reg = <0x58>;
    ...
    // Input from DP controller
    port@0 {
        reg = <0>;
        ...
    };

    // Output to Type-C connector / DP panel
    port@1 {
        reg = <1>;

        anx7625_out0: endpoint@0 {
            reg = <0>;
            mode-switch;
            remote-endpoint = <&c0_sstrx1>;
        };
        anx7625_out1: endpoint@1 {
            reg = <1>;
            mode-switch;
            remote-endpoint = <&c1_sstrx1>;
        };
    };
};

// USB3 hub
usb3hub: foo_hub {
    ...
    ports@0 {
         // End point connected to USB3 host controller on SOC.
    };
    port@1 {
        reg = <1>;

        foo_hub_out0: endpoint@0 {
            reg = <0>;
            mode-switch; ---> See c.) later
            remote-endpoint = <&c0_sstrx2>;
        };
        foo_hub_out1: endpoint@1 {
            reg = <1>;
            mode-switch;
            remote-endpoint = <&c1_sstrx2>;
        };
    };
};

Notes:
- On the Chrome OS platform, the USB3 Hub is controlled by
the EC, so we don't really need to describe that connection,
but I've added a minimal one here just to show how the graph
connection would work if the HUB was controlled by the SoC.
- The above assumes that other hardware is controlling orientation.
We can add "orientation-switch" drivers along the graph path
if there is other hardware which controls orientation.

Example 2: 1 USB-C connector connected to 1 drm-bridge/ mode-switch

I've tried to use Bjorn's example [1], but I might have made
some mistakes since I don't have access to the schematic.


                  SoC
  +------------------------------------------+
  |                                          |
  |  +---------------+                       |
  |  |               |                       |
  |  |  DP ctrllr    |       +---------+     |                 C0
  |  |               +-------+         |     |   2 lane     +----------+
  |  +---------------+       |  QMP    +-----+-----/--------+ SSTRX1   |
  |                          |  PHY    |     |              |          |
  |  +-------------+  2 lane |         |     |   2 lane     |          |
  |  |             +----/----+         +-----+-----/--------+ SSTRX2   |
  |  |    dwc3     |         +---------+     |              |          |
  |  |             |                         |              |          |
  |  |             |         +---------+     |              |          |
  |  |             +---------+ HS PHY  |     |   HS lanes   |          |
  |  +-------------+         |         +-----+----/---------+ D +/-    |
  |                          |         |     |              +----------+
  |                          +---------+     |
  |                                          |
  +------------------------------------------+

The DT would look something like this (borrowing from Stephen's example [2]):

qmp {
    mode-switch; ----> See b.) later.
    orientation-switch;
    ports {
        qmp_usb_in: port@0 {
            reg = <0>;
            remote-endpoint = <&usb3_phy_out>;
        };
        qmp_dp_in: port@1 {
            reg = <1>;
            remote-endpoint = <&dp_phy_out>;
        };
        port@2 {
            reg = <2>;
            qmp_usb_dp_out0: endpoint@0 {
                reg = <0>;
                remote-endpoint = <&c0_sstrx1>;
            };
            qmp_usb_dp_out1: endpoint@1 {
                reg = <1>;
                remote-endpoint = <&c0_sstrx2>;
            };
        };
};

dp-phy {
    ports {
        dp_phy_out: port {
            remote-endpoint = <&qmp_dp_in>;
        };
    };
};

dwc3: usb-phy {
    ports {
        usb3_phy_out: port@0 {
            reg = <0>;
            remote-endpoint = <&qmp_usb_in>;
        };
    };
};

glink {
    c0: usb-c-connector {
        compatible = "usb-c-connector";
        ports {
            hs: port@0 {
                reg = <0>;
                endpoint@0 {
                    reg = <0>;
                    remote-endpoint = <&hs_phy_out>;
                };
            };

            ss: port@1 {
                reg = <1>;
                c0_sstrx1: endpoint@0 {
                    reg = <0>;
                    remote-endpoint = <&qmp_usb_dp_out0>;
                };
                c0_sstrx2: endpoint@1 {
                    reg = <1>;
                    remote-endpoint = <&qmp_usb_dp_out1>;
                };
            };
        };
    };
};

Notes:
a. This proposal doesn't deal with the DRM bridge HPD forwarding; I
believe that is covered by Stephen's example/proposal in [2], and
can be addressed separately. That said, this binding is compatible
with the proposal in [2], that is, make the "mode-switch" driver a
drm-bridge and forward the HPD info to the upstream DRM-bridge (DP controller).
The driver implementing "mode-switch" will be able to do that, since
it gets DP status/attention VDOS with HPD info from the Type-C port driver.
b. If both SSTRX pairs from a connector are routed to the same
hardware block (example 2) then the device would keep "mode-switch"
as a top level property (and the fwnode associated with "mode-switch"
is the drm-bridge device).
c. If SSTRX pairs from 2 connectors are routed to the same
hardware block (example 1), then each end-point which is connected to
the USB-C connector will have a "mode-switch" property in its end-point.
There will be 2 mode switches registered here, and the fwnode for each
"mode-switch" is the end-point node.

b.) and c.) can be handled by Type C mux registration and matching
code. We already have 3 mux devs for each mux [3].

For the single mode-switch case, mux_dev[1] will just refer to the top-level
mode-switch registered by the DRM bridge / switch driver (example 1).
For the 2 mode-switch case, typec_mux_dev[1] will have 2 child
typec_mux_dev's, each of which represents the mode-switches
registered by the DRM bridge / switch driver. Introducing this
indirection means the port driver / alternate mode driver don't
need to care about how the connectors are routed; the framework
will just call the mux_set() function on the mux_dev() or its
children if it has any.

The benefit of this approach is existing bindings (which just
assume 1 endpoint from usb-c-connector/port@1) should continue to
work without any changes.

Why don't we use data lanes for the usb-c-connector
endpoints? I guess we could, but I am not a fan of adding the
extra data-lane parsing logic to the Type-C framework (I
don't think drivers need that level of detail from the connector
binding). And even then, we will still need an extra end-point
if the lanes of the USB-C connector are routed to different hardware blocks.

The Type-C connector spec doesn't specify any alternate modes
with < 1 SSTRX pair, so the most we can ever have (short of a
major change to the spec) is 2 SSTRX end points for a
connector each being routed to different hardware blocks.
Codifying these as endpoint@0 and endpoint@1 in the usb-c-connector
binding seems to line up nicely with this detail of the spec.

Thanks,

-Prashant

[1] https://lore.kernel.org/linux-usb/Yv1y9Wjp16CstJvK@baldur/
[2] https://lore.kernel.org/linux-usb/CAE-0n52-QVeUVCB1qZzPbYyrb1drrbJf6H2DEEW9bOE6mh7egw@mail.gmail.com/
[3] https://elixir.bootlin.com/linux/v6.0-rc3/source/drivers/usb/typec/mux.c#L259
